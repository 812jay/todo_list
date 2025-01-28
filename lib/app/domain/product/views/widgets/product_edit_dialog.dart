import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductEditDialog extends StatefulWidget {
  const ProductEditDialog({
    super.key,
    this.product,
  });
  final ProductItemRes? product;

  @override
  State<ProductEditDialog> createState() => _ProductEditDialogState();
}

class _ProductEditDialogState extends State<ProductEditDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextFormField(
        initialValue: widget.product?.title ?? '',
      ),
      content: SizedBox(
        width: context.width,
        height: 600,
        child: Column(
          children: [
            Text(widget.product?.assignee ?? ''),
            TextFormField(
              initialValue: widget.product?.content ?? '',
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: const Text(
              '취소',
              style: TextStyle(
                color: AppColors.cancelButton,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.saveButton,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: const Text(
              '저장',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
