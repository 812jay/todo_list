import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.item,
  });
  final ParsedProductItemRes item;

  @override
  Widget build(BuildContext context) {
    return HoverContainer(
      hoverColor: AppColors.productGroupItem,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                item.assignee ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
