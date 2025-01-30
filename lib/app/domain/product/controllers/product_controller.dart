import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/product/services/product_service.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_detail_dialog.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/app/domain/user/services/user_services.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  ProductController({
    required this.productService,
    required this.userService,
  });

  // 외부 서비스 의존성
  final ProductService productService;
  final UserService userService;

  // 상태 관리 변수
  List<UserRes> userList = [];
  final AppFlowyBoardController boardController = AppFlowyBoardController();

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  // 초기 데이터 로드
  Future<void> _initializeData() async {
    await Future.wait([
      _fetchProducts(),
      _fetchUsers(),
    ]);
  }

  // 데이터 가져오기 관련 메서드
  Future<void> _fetchProducts() async {
    final products = await productService.fetchProductList();
    _addProductsToBoard(products);
  }

  Future<void> _fetchUsers() async {
    userList = await userService.fetchUserList();
  }

  // 보드 관리 관련 메서드
  void _addProductsToBoard(List<ProductRes> products) {
    for (final product in products) {
      boardController.addGroup(
        AppFlowyGroupData(
          id: product.groupTitle,
          name: product.groupTitle,
          items: _createProductItems(product.itemList),
        ),
      );
    }
  }

  // 제품 아이템 생성 관련 메서드
  List<AppFlowyGroupItem> _createProductItems(List<ProductItemRes>? items) {
    return (items ?? []).map(_createProductItem).toList();
  }

  AppFlowyGroupItem _createProductItem(ProductItemRes item) {
    return ParsedProductItemRes(
      groupTitle: item.groupTitle,
      itemId: const Uuid().v4(),
      title: item.title,
      assignee: item.assignee,
      content: item.content,
      createdAt: item.createdAt,
      updatedAt: item.updatedAt,
    ) as AppFlowyGroupItem;
  }

  // 아이템 다이얼로그 및 조작 관련 메서드
  void showItemDialog(
    BuildContext context, {
    ParsedProductItemRes? item,
    String? groupTitle,
  }) {
    showDialog(
      context: context,
      builder: (context) => ProductDetailDialog(
        productItem: item,
        groupTitle: groupTitle,
        userList: userList,
        onTapAddButton: _handleItemAddOrUpdate(groupTitle),
        onTapDeleteButton: _handleItemDelete,
      ),
    );
  }

  // 아이템 추가/수정 핸들러
  Function(ParsedProductItemRes) _handleItemAddOrUpdate(String? groupTitle) {
    return (productItem) {
      groupTitle != null ? _addItem(productItem) : _updateItem(productItem);
    };
  }

  // 아이템 CRUD 작업
  void _addItem(ParsedProductItemRes item) {
    boardController.addGroupItem(item.groupTitle, item);
  }

  void _updateItem(ParsedProductItemRes item) {
    final currentGroup = _findItemGroup(item.itemId, item.groupTitle);
    boardController.updateGroupItem(currentGroup.id, item);
  }

  void _handleItemDelete({
    required String groupId,
    required String itemId,
  }) {
    final currentGroup = _findItemGroup(itemId, groupId);
    boardController.removeGroupItem(currentGroup.id, itemId);
  }

  // 유틸리티 메서드: 아이템 그룹 찾기 관련
  AppFlowyGroupData _findItemGroup(String itemId, String defaultGroupTitle) {
    return boardController.groupDatas.firstWhere(
      (group) => _hasItem(group, itemId),
      orElse: () => _findGroupById(defaultGroupTitle),
    );
  }

  bool _hasItem(AppFlowyGroupData group, String itemId) {
    return group.items.any(
      (item) => (item as ParsedProductItemRes).itemId == itemId,
    );
  }

  AppFlowyGroupData _findGroupById(String groupId) {
    return boardController.groupDatas.firstWhere(
      (group) => group.id == groupId,
    );
  }
}
