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

class ProductDetailDialog extends StatefulWidget {
  const ProductDetailDialog({
    super.key,
    this.groupTitle,
    this.productItem,
    this.onTapAddButton,
    this.onTapDeleteButton,
    this.userList = const [],
  });
  final String? groupTitle;
  final ParsedProductItemRes? productItem;
  final void Function(
    ParsedProductItemRes productItem,
  )? onTapAddButton;
  final void Function({
    required String groupId,
    required String itemId,
  })? onTapDeleteButton;
  final List<UserRes> userList;

  @override
  State<ProductDetailDialog> createState() => _ProductDetailDialogState();
}

class _ProductDetailDialogState extends State<ProductDetailDialog> {
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
      content: _buildDialogContent(),
      actions: [_buildActionButtons()],
    );
  }

  // 다이얼로그 본문 위젯
  Widget _buildDialogContent() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleField(),
            const SizedBox(height: 20),
            _buildAssigneeSection(),
            const SizedBox(height: 20),
            _buildDescriptionField(),
          ],
        ),
      ),
    );
  }

  // 제목 입력 필드
  Widget _buildTitleField() {
    return BaseTextField(
      controller: titleController,
      title: '제목',
      hintText: '제목을 입력해 주세요.',
      isRequired: true,
      maxLines: 1,
    );
  }

  // 담당자 선택 섹션
  Widget _buildAssigneeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '담당자',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _buildAssigneeDropdown(),
      ],
    );
  }

  // 담당자 드롭다운
  Widget _buildAssigneeDropdown() {
    return DropdownSearch<UserRes?>(
      key: dropDownKey,
      selectedItem: selectedUser,
      items: _getUniqueUserList(),
      onChanged: (value) => setState(() => selectedUser = value),
      itemAsString: (UserRes? user) => user?.name ?? '담당자 없음',
      popupProps: PopupProps.menu(
        itemBuilder: _buildDropdownItem,
      ),
      dropdownBuilder: (context, selectedItem) =>
          _buildSelectedUser(selectedItem),
    );
  }

  // 담당자 목록 중복 제거
  List<UserRes?> _getUniqueUserList() {
    return {
      selectedUser,
      null,
      ...widget.userList.where((user) => user.name != selectedUser?.name),
    }.toList();
  }

  // 드롭다운 아이템 빌더
  Widget _buildDropdownItem(
      BuildContext context, UserRes? item, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: _buildSelectedUser(item),
    );
  }

  // 선택된 사용자 표시 위젯
  Widget _buildSelectedUser(UserRes? user) {
    return Row(
      children: [
        UserAvatar(user: user),
        const SizedBox(width: 8),
        Text(user?.name ?? '담당자 없음'),
      ],
    );
  }

  // 설명 입력 필드
  Widget _buildDescriptionField() {
    return SingleChildScrollView(
      child: BaseTextField(
        controller: contentController,
        title: '설명',
        hintText: '설명을 입력해 주세요.',
        maxLines: 10,
      ),
    );
  }

  // 하단 버튼 영역
  Widget _buildActionButtons() {
    return Row(
      children: [
        // 삭제 버튼 (기존 항목 수정 시에만 표시)
        if (widget.productItem != null) _buildDeleteButton(),
        const Spacer(),
        _buildCancelButton(),
        const SizedBox(width: 10),
        _buildSaveButton(),
      ],
    );
  }

  // 삭제 버튼
  Widget _buildDeleteButton() {
    return DialogButton(
      text: '삭제',
      backgroundColor: AppColors.deleteButtonBackground,
      fontColor: AppColors.deleteButtonFont,
      borderColor: AppColors.deleteButtonBorder,
      onTap: _handleDelete,
    );
  }

  // 취소 버튼
  Widget _buildCancelButton() {
    return DialogButton(
      text: '취소',
      backgroundColor: AppColors.cancelButtonBackground,
      fontColor: AppColors.cancelButtonFont,
      onTap: () => Get.back(),
    );
  }

  // 저장 버튼
  Widget _buildSaveButton() {
    return DialogButton(
      text: '저장',
      backgroundColor: AppColors.saveButtonBackground,
      fontColor: AppColors.saveButtonFont,
      onTap: _handleSave,
    );
  }

  // 삭제 처리
  void _handleDelete() {
    widget.onTapDeleteButton?.call(
      groupId: widget.productItem!.groupTitle,
      itemId: widget.productItem!.id,
    );
    Get.back();
  }

  // 저장 처리
  void _handleSave() {
    widget.onTapAddButton?.call(
      ParsedProductItemRes(
        itemId: widget.productItem?.id ?? const Uuid().v4(),
        groupTitle:
            widget.groupTitle ?? widget.productItem?.groupTitle ?? '할 일',
        title: titleController.text,
        assignee: selectedUser,
        content: contentController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    Get.back();
  }
}
