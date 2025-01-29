import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserRes with _$UserRes {
  const factory UserRes({
    required String name,
    String? profileImgPath,
  }) = _UserRes;

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);
}
