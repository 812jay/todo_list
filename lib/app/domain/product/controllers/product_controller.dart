import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_edit_dialog.dart';
import 'package:todo_list/app/domain/user/models/user_model.dart';
import 'package:todo_list/core/utils/dummy_data.dart';

class ProductController extends GetxController {
  //
  final AppFlowyBoardController appFlowyBoardController =
      AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) =>
        debugPrint('Move item from $fromIndex to $toIndex'),
    onMoveGroupItem: (groupId, fromIndex, toIndex) =>
        debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex'),
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) =>
        debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex'),
  );

  List<AppFlowyGroupData> groupList = [];

  @override
  void onInit() {
    groupList = DummyData.groupList;
    for (var group in groupList) {
      appFlowyBoardController.addGroup(group);
    }
    super.onInit();
  }

  void onClickItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ProductEditDialog(),
    );
  }

  void onTapAddButton({
    required String title,
    required String content,
    UserModel? manager,
  }) {
    groupList.add(
      AppFlowyGroupData(
        id: title,
        name: title,
        items: [],
      ),
    );
  }

  void parseGroupData(){
    
  }
}
