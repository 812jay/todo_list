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
      child: HoverContainer(
        hoverColor: AppColors.productGroupItem,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserAvatar(
                    user: item.assignee,
                    size: 20,
                    isShowText: true,
                    fontSize: 13,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      item.assignee?.name ?? '담당자 없음',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
