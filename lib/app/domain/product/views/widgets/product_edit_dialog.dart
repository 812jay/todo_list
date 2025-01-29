import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/component/base_text_field.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductEditDialog extends StatefulWidget {
  const ProductEditDialog({
    super.key,
    this.productItem,
    this.onTapAddButton,
  });
  final ParsedProductItemRes? productItem;
  final Function(String, String, String, UserRes?)? onTapAddButton;

  @override
  State<ProductEditDialog> createState() => _ProductEditDialogState();
}

class _ProductEditDialogState extends State<ProductEditDialog> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.productItem?.title ?? '');
    contentController =
        TextEditingController(text: widget.productItem?.content ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: BaseTextField(
        controller: titleController,
        title: '제목',
        hintText: '제목을 입력해 주세요.',
        isRequired: true,
        maxLines: 1,
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: context.height * 0.5,
        ),
        child: SizedBox(
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BaseTextField(
                  controller: contentController,
                  title: '설명',
                  hintText: '설명을 입력해 주세요.',
                  maxLines: 10,
                )
              ],
            ),
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
