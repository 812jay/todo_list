import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 공통으로 사용되는 텍스트 필드 위젯
class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    required this.controller,
    this.title,
    this.isRequired,
    this.onChanged,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.maxLines,
    this.inputFormatters,
  });

  final TextEditingController controller;
  // 텍스트 필드 상단에 표시될 제목
  final String? title;
  // 필수 입력 여부
  final bool? isRequired;
  // 텍스트 변경 시 호출될 콜백
  final Function(String)? onChanged;
  // 키보드 타입 설정
  final TextInputType? keyboardType;
  // 힌트 텍스트
  final String? hintText;
  // 에러 메시지
  final String? errorText;
  // 최대 줄 수
  final int? maxLines;
  // 입력 형식 지정
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) _buildTitle(),
        const SizedBox(height: 10),
        _buildTextField(),
      ],
    );
  }

  // 제목 부분 위젯 생성
  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 3),
        if (isRequired == true) _buildRequiredMark(),
      ],
    );
  }

  // 필수 입력 표시 위젯
  Widget _buildRequiredMark() {
    return const Text(
      '*',
      style: TextStyle(
        color: Colors.red,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // 텍스트 필드 위젯 생성
  Widget _buildTextField() {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }
}
