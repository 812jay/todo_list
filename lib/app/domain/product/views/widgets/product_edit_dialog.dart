import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/component/base_text_field.dart';
import 'package:todo_list/core/utils/component/dialog_button.dart';
import 'package:todo_list/core/utils/component/user_avatar.dart';
import 'package:todo_list/core/utils/constants.dart';
import 'package:uuid/uuid.dart';

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
  final void Function(
    ParsedProductItemRes productItem,
  )? onTapAddButton;
  final List<UserRes> userList;

  @override
  State<ProductEditDialog> createState() => _ProductEditDialogState();
}

class _ProductEditDialogState extends State<ProductEditDialog> {
  final dropDownKey = GlobalKey<DropdownSearchState>();
  late final TextEditingController titleController;
  late final TextEditingController contentController;
  UserRes? selectedUser;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.productItem?.title ?? '');
    contentController =
        TextEditingController(text: widget.productItem?.content ?? '');
    selectedUser = widget.productItem?.assignee;
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
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseTextField(
                controller: titleController,
                title: '제목',
                hintText: '제목을 입력해 주세요.',
                isRequired: true,
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              const Text(
                '담당자',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownSearch<UserRes?>(
                key: dropDownKey,
                selectedItem: selectedUser,
                items: {
                  selectedUser,
                  null,
                  ...widget.userList
                      .where((user) => user.name != selectedUser?.name),
                }.toList(),
                onChanged: (value) {
                  selectedUser = value;
                },
                itemAsString: (UserRes? user) => user?.name ?? '담당자 없음',
                popupProps: PopupProps.menu(
                  itemBuilder: (context, item, isSelected) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          UserAvatar(user: item),
                          const SizedBox(width: 8),
                          Text(
                            item?.name ?? '담당자 없음',
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
              const SizedBox(height: 20),
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
          onTap: () {
            widget.onTapAddButton?.call(
              ParsedProductItemRes(
                itemId: widget.productItem?.id ?? const Uuid().v4(),
                groupTitle: widget.groupTitle ??
                    widget.productItem?.groupTitle ??
                    '할 일',
                title: titleController.text,
                assignee: selectedUser,
                content: contentController.text,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );
            Get.back();
          },
        ),
      ],
    );
  }
}
