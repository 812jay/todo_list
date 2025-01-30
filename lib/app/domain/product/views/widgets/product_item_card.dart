import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/component/user_avatar.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final ParsedProductItemRes item;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildCardItem(),
    );
  }

  Widget _buildCardItem() {
    return HoverContainer(
      hoverColor: AppColors.productGroupItem,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: _buildContent(),
    );
  }

  // 카드의 메인 컨텐츠 컬럼
  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제품 타이틀
        Text(item.title),
        const SizedBox(height: 10),
        _buildAssigneeRow(),
      ],
    );
  }

  // 담당자 정보를 표기
  Widget _buildAssigneeRow() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 담당자 아바타
          UserAvatar(
            user: item.assignee,
            size: 20,
            isShowText: true,
            fontSize: 13,
          ),
          const SizedBox(width: 5),
          // 담당자 이름
          Expanded(
            child: Text(
              item.assignee?.name ?? '담당자 없음',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
