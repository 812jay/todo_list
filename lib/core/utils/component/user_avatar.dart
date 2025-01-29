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
  });
  final UserRes? user;
  final bool? isShowText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
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
                  : const AssetIcon(
                      'svgs/user.svg',
                      size: 20,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        isShowText == true
            ? Text(
                user?.name ?? '담당자 없음',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
