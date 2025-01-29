import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/component/base_text_field.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: TextFormField(
      //   initialValue: widget.product?.title ?? '',
      // ),
      title: BaseTextField(
        controller: contentController,
        title: '제목',
        hintText: '제목을 입력해 주세요.',
        isRequired: true,
      ),
      content: SizedBox(
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.product?.assignee ?? ''),
              BaseTextField(
                controller: contentController,
                title: '설명',
                hintText: '설명을 입력해 주세요.',
                maxLines: 60,
              )
            ],
          ),
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
