import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_item.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.item,
  });
  final ProductItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                item.manager?.name ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}