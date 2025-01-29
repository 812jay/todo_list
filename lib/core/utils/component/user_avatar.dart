import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/component/asset_icon.dart';
import 'package:todo_list/core/utils/constants.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.user,
    this.isShowText,
    this.size,
    this.fontSize,
  });
  final UserRes? user;
  final bool? isShowText;
  final double? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 30,
      height: size ?? 30,
      child: CircularProfileAvatar(
        '',
        imageFit: BoxFit.contain,
        backgroundColor: AppColors.avatarBackgroud,
        elevation: 1.2,
        child: Center(
          child: user != null
              ? Text(
                  user!.name.split('')[0],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : AssetIcon(
                  'svgs/user.svg',
                  size: size != null ? (size! * 0.66) : 20,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
