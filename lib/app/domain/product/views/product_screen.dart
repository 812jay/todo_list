import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_list/app/domain/product/controllers/product_controller.dart';
import 'package:todo_list/app/domain/product/models/product_model.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_item_card.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: 500,
        margin: const EdgeInsets.all(10),
        child: AppFlowyBoard(
          controller: controller.appFlowyBoardController,
          config: const AppFlowyBoardConfig(
            groupBackgroundColor: AppColors.productGroup,
            groupBodyPadding: EdgeInsets.symmetric(horizontal: 0),
            groupCornerRadius: 2,
          ),
          headerBuilder: (context, groupData) {
            return AppFlowyGroupHeader(
              key: ObjectKey(groupData),
              margin: const EdgeInsets.all(15),
              title: Text(groupData.headerData.groupName),
            );
          },
          cardBuilder: (context, groupData, item) {
            final newItem = item as ParsedProductItemRes;
            return AppFlowyGroupCard(
              key: ObjectKey(item),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              child: ProductItemCard(
                item: newItem,
              ),
            );
          },
          footerBuilder: (context, groupData) {
            return AppFlowyGroupFooter(
              onAddButtonClick: () {
                controller.onClickItem(context);
              },
              icon: const Icon(Icons.add),
              height: 50,
              title: const Text('이슈 만들기'),
            );
          },
        ),
      ),
    );
  }
}
