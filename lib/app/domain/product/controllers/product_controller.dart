import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() {
    final group1 = DummyData.group1;
    final group2 = DummyData.group2;
    final group3 = DummyData.group3;
    final group4 = DummyData.group4;
    appFlowyBoardController.addGroup(group1);
    appFlowyBoardController.addGroup(group2);
    appFlowyBoardController.addGroup(group3);
    appFlowyBoardController.addGroup(group4);
    super.onInit();
  }
}
