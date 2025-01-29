import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/component/base_text_field.dart';
import 'package:todo_list/core/utils/component/dialog_button.dart';
import 'package:todo_list/core/utils/component/user_avatar.dart';
import 'package:todo_list/core/utils/constants.dart';

class ProductEditDialog extends StatefulWidget {
  const ProductEditDialog({
    super.key,
    this.groupTitle,
    this.productItem,
    this.onTapAddButton,
    this.userList = const [],
  });
  final String? groupTitle;
  final ParsedProductItemRes? productItem;
  final Function(String, String, String, UserRes?)? onTapAddButton;
  final List<UserRes> userList;

  @override
  State<ProductEditDialog> createState() => _ProductEditDialogState();
}

class _ProductEditDialogState extends State<ProductEditDialog> {
  final dropDownKey = GlobalKey<DropdownSearchState>();
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
      content: SizedBox(
        width: context.width,
        height: context.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseTextField(
              controller: titleController,
              title: '제목',
              hintText: '제목을 입력해 주세요.',
              isRequired: true,
              maxLines: 1,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Text(
              '담당자',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            DropdownSearch<UserRes>(
              key: dropDownKey,
              selectedItem: widget.productItem?.assignee,
              items: widget.userList,
              itemAsString: (UserRes? user) => user?.name ?? '',
              dropdownBuilder: (context, selectedItem) {
                return Row(
                  children: [
                    UserAvatar(user: selectedItem),
                    const SizedBox(width: 8),
                    Text(
                      selectedItem?.name ?? '담당자 없음',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: BaseTextField(
                controller: contentController,
                title: '설명',
                hintText: '설명을 입력해 주세요.',
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
      actions: [
        DialogButton(
          text: '취소',
          backgroundColor: AppColors.cancelButtonBackground,
          fontColor: AppColors.cancelButtonFont,
          onTap: () => Get.back(),
        ),
        DialogButton(
          text: '저장',
          backgroundColor: AppColors.saveButtonBackground,
          fontColor: AppColors.saveButtonFont,
          onTap: () => Get.back(),
        ),
      ],
    );
  }
}
