import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/component/asset_icon.dart';
import 'package:todo_list/core/utils/constants.dart';

/// 사용자 아바타를 표시하는 위젯
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.user,
    this.isShowText,
    this.size = 30, // 기본값 설정
    this.fontSize = 15, // 기본값 설정
  });

  // 위젯 속성 정의
  final UserRes? user;
  final bool? isShowText;
  final double? size;
  final double? fontSize;

  // 사용자 이니셜을 표시하는 텍스트 위젯
  Widget _buildUserInitial() {
    return Text(
      user!.name.split('')[0],
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // 기본 사용자 아이콘 위젯
  Widget _buildDefaultUserIcon() {
    return AssetIcon(
      'svgs/user.svg',
      size: size != null ? (size! * 0.66) : 20,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProfileAvatar(
        '',
        imageFit: BoxFit.contain,
        backgroundColor: AppColors.avatarBackgroud,
        elevation: 1.2,
        child: Center(
          child: user != null ? _buildUserInitial() : _buildDefaultUserIcon(),
        ),
      ),
    );
  }
}
