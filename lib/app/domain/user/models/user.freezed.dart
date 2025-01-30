// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRes _$UserResFromJson(Map<String, dynamic> json) {
  return _UserRes.fromJson(json);
}

/// @nodoc
mixin _$UserRes {
  String get name => throw _privateConstructorUsedError;
  String? get profileImgPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResCopyWith<UserRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResCopyWith<$Res> {
  factory $UserResCopyWith(UserRes value, $Res Function(UserRes) then) =
      _$UserResCopyWithImpl<$Res, UserRes>;
  @useResult
  $Res call({String name, String? profileImgPath});
}

/// @nodoc
class _$UserResCopyWithImpl<$Res, $Val extends UserRes>
    implements $UserResCopyWith<$Res> {
  _$UserResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profileImgPath = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgPath: freezed == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserResImplCopyWith<$Res> implements $UserResCopyWith<$Res> {
  factory _$$UserResImplCopyWith(
          _$UserResImpl value, $Res Function(_$UserResImpl) then) =
      __$$UserResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? profileImgPath});
}

/// @nodoc
class __$$UserResImplCopyWithImpl<$Res>
    extends _$UserResCopyWithImpl<$Res, _$UserResImpl>
    implements _$$UserResImplCopyWith<$Res> {
  __$$UserResImplCopyWithImpl(
      _$UserResImpl _value, $Res Function(_$UserResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profileImgPath = freezed,
  }) {
    return _then(_$UserResImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgPath: freezed == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResImpl implements _UserRes {
  const _$UserResImpl({required this.name, this.profileImgPath});

  factory _$UserResImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResImplFromJson(json);

  @override
  final String name;
  @override
  final String? profileImgPath;

  @override
  String toString() {
    return 'UserRes(name: $name, profileImgPath: $profileImgPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImgPath, profileImgPath) ||
                other.profileImgPath == profileImgPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, profileImgPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      __$$UserResImplCopyWithImpl<_$UserResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResImplToJson(
      this,
    );
  }
}

abstract class _UserRes implements UserRes {
  const factory _UserRes(
      {required final String name,
      final String? profileImgPath}) = _$UserResImpl;

  factory _UserRes.fromJson(Map<String, dynamic> json) = _$UserResImpl.fromJson;

  @override
  String get name;
  @override
  String? get profileImgPath;
  @override
  @JsonKey(ignore: true)
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
