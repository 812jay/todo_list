import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_list/app/domain/product/controllers/product_controller.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_item_card.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  // 보드 설정값
  static const _boardConfig = AppFlowyBoardConfig(
    groupBackgroundColor: AppColors.productGroup,
    groupBodyPadding: EdgeInsets.symmetric(horizontal: 0),
    groupCornerRadius: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: _buildBoard(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Board'),
      backgroundColor: Colors.white,
    );
  }

  // 메인 보드
  Widget _buildBoard() {
    return Container(
      height: 500,
      margin: const EdgeInsets.all(10),
      child: AppFlowyBoard(
        controller: controller.boardController,
        config: _boardConfig,
        headerBuilder: _buildGroupHeader,
        cardBuilder: _buildGroupCard,
        footerBuilder: _buildGroupFooter,
      ),
    );
  }

  // 그룹명과 아이템 개수 표시
  Widget _buildGroupHeader(BuildContext context, AppFlowyGroupData groupData) {
    return AppFlowyGroupHeader(
      key: ValueKey(groupData),
      margin: const EdgeInsets.all(15),
      title: RichText(
        text: TextSpan(
          text: groupData.headerData.groupName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: ' ${groupData.items.length}',
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  // 아이템 카드
  Widget _buildGroupCard(BuildContext context, AppFlowyGroupData groupData,
      AppFlowyGroupItem item) {
    final newItem = item as ParsedProductItemRes;
    return AppFlowyGroupCard(
      key: ValueKey(item),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      child: ProductItemCard(
        item: newItem,
        onTap: () => controller.showItemDialog(context, item: item),
      ),
    );
  }

  // 새 아이템 추가 버튼
  Widget _buildGroupFooter(BuildContext context, AppFlowyGroupData groupData) {
    return AppFlowyGroupFooter(
      onAddButtonClick: () {
        controller.showItemDialog(
          context,
          groupTitle: groupData.id,
        );
      },
      icon: const Icon(Icons.add),
      height: 50,
      title: const Text('이슈 추가'),
    );
  }
}
