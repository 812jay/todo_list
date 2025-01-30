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
  ProductController(
    this.productService,
    this.userService,
  );
  final ProductService productService;
  final UserService userService;
  List<UserRes> userList = [];

  final AppFlowyBoardController appFlowyBoardController =
      AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) =>
        debugPrint('Move item from $fromIndex to $toIndex'),
    onMoveGroupItem: (groupId, fromIndex, toIndex) =>
        debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex'),
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) =>
        debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex'),
  );

  @override
  void onInit() {
    fetchProductList();
    fetchUserList();
    super.onInit();
  }

  Future<void> fetchProductList() async {
    final List<ProductRes> productList =
        await productService.fetchProductList();

    for (var product in productList) {
      appFlowyBoardController.addGroup(
        AppFlowyGroupData(
          id: product.groupTitle,
          name: product.groupTitle,
          items: parsedProductItemList(product.itemList),
        ),
      );
    }
  }

  List<AppFlowyGroupItem> parsedProductItemList(
    List<ProductItemRes>? itemList,
  ) {
    return (itemList ?? []).map((item) {
      return parsedProductItem(item);
    }).toList();
  }

  AppFlowyGroupItem parsedProductItem(ProductItemRes productItem) {
    final String itemId = const Uuid().v4();
    return ParsedProductItemRes(
      groupTitle: productItem.groupTitle,
      itemId: itemId,
      title: productItem.title,
      assignee: productItem.assignee,
      content: productItem.content,
      createdAt: productItem.createdAt,
      updatedAt: productItem.updatedAt,
    ) as AppFlowyGroupItem;
  }

  Future<void> fetchUserList() async {
    final List<UserRes> userListData = await userService.fetchUserList();
    userList = userListData;
  }

  void onTapItem(
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
        onTapAddButton: (productItem) {
          if (groupTitle != null) {
            onAddItem(productItem);
            return;
          }
          onUpdateItem(productItem);
        },
        onTapDeleteButton: ({
          required String groupId,
          required String itemId,
        }) {
          onDeleteItem(groupId, itemId);
        },
      ),
    );
  }

  void onAddItem(
    ParsedProductItemRes productItem,
  ) {
    appFlowyBoardController.addGroupItem(
      productItem.groupTitle,
      productItem,
    );
  }

  void onUpdateItem(
    ParsedProductItemRes productItem,
  ) {
    final currentGroup = findCurrentGroup(
      productItem.itemId,
      productItem.groupTitle,
    );

    appFlowyBoardController.updateGroupItem(
      currentGroup.id,
      productItem,
    );
  }

  // 현재 아이템이 실제로 위치한 그룹 찾기
  AppFlowyGroupData findCurrentGroup(String itemId, String defaultGroupTitle) {
    return appFlowyBoardController.groupDatas.firstWhere(
      (group) => group.items
          .any((item) => (item as ParsedProductItemRes).itemId == itemId),
      orElse: () => appFlowyBoardController.groupDatas
          .firstWhere((group) => group.id == defaultGroupTitle),
    );
  }

  void onDeleteItem(
    String groupId,
    String itemId,
  ) {
    appFlowyBoardController.removeGroupItem(
      groupId,
      itemId,
    );
  }
}
