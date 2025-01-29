import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/product/services/product_service.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_edit_dialog.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/app/domain/user/services/user_services.dart';
import 'package:todo_list/core/utils/logger.dart';

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
    return ParsedProductItemRes(
      groupTitle: productItem.groupTitle,
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
    AppLogger.debug(groupTitle);
    showDialog(
      context: context,
      builder: (context) => ProductEditDialog(
        productItem: item,
        groupTitle: groupTitle,
        userList: userList,
      ),
    );
  }
}
