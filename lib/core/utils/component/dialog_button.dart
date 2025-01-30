import 'package:flutter/material.dart';

/// 다이얼로그에서 사용되는 커스텀 버튼 위젯
class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.text,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
    this.fontColor,
  });

  // 버튼에 표시될 텍스트
  final String text;
  // 버튼 탭 이벤트 콜백
  final GestureTapCallback? onTap;
  // 테두리 색상
  final Color? borderColor;
  // 배경 색상
  final Color? backgroundColor;
  // 글자 색상
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildButtonContainer(),
    );
  }

  /// 버튼의 컨테이너를 구성하는 위젯
  Widget _buildButtonContainer() {
    return Container(
      decoration: _buildContainerDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: _buildButtonText(),
    );
  }

  /// 버튼 컨테이너의 데코레이션 설정
  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: backgroundColor ?? Colors.grey,
      borderRadius: BorderRadius.circular(10),
      border: _buildBorder(),
    );
  }

  /// 테두리 설정
  Border? _buildBorder() {
    return borderColor != null
        ? Border.all(
            color: borderColor!,
            width: 1,
          )
        : null;
  }

  /// 버튼 텍스트 위젯
  Widget _buildButtonText() {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
      ),
    );
  }
}
