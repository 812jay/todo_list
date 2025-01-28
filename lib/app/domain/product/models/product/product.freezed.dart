// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRes _$ProductResFromJson(Map<String, dynamic> json) {
  return _ProductRes.fromJson(json);
}

/// @nodoc
mixin _$ProductRes {
  String get groupTitle => throw _privateConstructorUsedError;
  List<ProductItemRes>? get itemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductResCopyWith<ProductRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResCopyWith<$Res> {
  factory $ProductResCopyWith(
          ProductRes value, $Res Function(ProductRes) then) =
      _$ProductResCopyWithImpl<$Res, ProductRes>;
  @useResult
  $Res call({String groupTitle, List<ProductItemRes>? itemList});
}

/// @nodoc
class _$ProductResCopyWithImpl<$Res, $Val extends ProductRes>
    implements $ProductResCopyWith<$Res> {
  _$ProductResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupTitle = null,
    Object? itemList = freezed,
  }) {
    return _then(_value.copyWith(
      groupTitle: null == groupTitle
          ? _value.groupTitle
          : groupTitle // ignore: cast_nullable_to_non_nullable
              as String,
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ProductItemRes>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductResImplCopyWith<$Res>
    implements $ProductResCopyWith<$Res> {
  factory _$$ProductResImplCopyWith(
          _$ProductResImpl value, $Res Function(_$ProductResImpl) then) =
      __$$ProductResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupTitle, List<ProductItemRes>? itemList});
}

/// @nodoc
class __$$ProductResImplCopyWithImpl<$Res>
    extends _$ProductResCopyWithImpl<$Res, _$ProductResImpl>
    implements _$$ProductResImplCopyWith<$Res> {
  __$$ProductResImplCopyWithImpl(
      _$ProductResImpl _value, $Res Function(_$ProductResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupTitle = null,
    Object? itemList = freezed,
  }) {
    return _then(_$ProductResImpl(
      groupTitle: null == groupTitle
          ? _value.groupTitle
          : groupTitle // ignore: cast_nullable_to_non_nullable
              as String,
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ProductItemRes>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductResImpl implements _ProductRes {
  const _$ProductResImpl(
      {required this.groupTitle, final List<ProductItemRes>? itemList})
      : _itemList = itemList;

  factory _$ProductResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductResImplFromJson(json);

  @override
  final String groupTitle;
  final List<ProductItemRes>? _itemList;
  @override
  List<ProductItemRes>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    if (_itemList is EqualUnmodifiableListView) return _itemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductRes(groupTitle: $groupTitle, itemList: $itemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductResImpl &&
            (identical(other.groupTitle, groupTitle) ||
                other.groupTitle == groupTitle) &&
            const DeepCollectionEquality().equals(other._itemList, _itemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, groupTitle, const DeepCollectionEquality().hash(_itemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductResImplCopyWith<_$ProductResImpl> get copyWith =>
      __$$ProductResImplCopyWithImpl<_$ProductResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductResImplToJson(
      this,
    );
  }
}

abstract class _ProductRes implements ProductRes {
  const factory _ProductRes(
      {required final String groupTitle,
      final List<ProductItemRes>? itemList}) = _$ProductResImpl;

  factory _ProductRes.fromJson(Map<String, dynamic> json) =
      _$ProductResImpl.fromJson;

  @override
  String get groupTitle;
  @override
  List<ProductItemRes>? get itemList;
  @override
  @JsonKey(ignore: true)
  _$$ProductResImplCopyWith<_$ProductResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItemRes _$ProductItemResFromJson(Map<String, dynamic> json) {
  return _ProductItemRes.fromJson(json);
}

/// @nodoc
mixin _$ProductItemRes {
  String get title => throw _privateConstructorUsedError;
  String? get assignee => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemResCopyWith<ProductItemRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemResCopyWith<$Res> {
  factory $ProductItemResCopyWith(
          ProductItemRes value, $Res Function(ProductItemRes) then) =
      _$ProductItemResCopyWithImpl<$Res, ProductItemRes>;
  @useResult
  $Res call(
      {String title,
      String? assignee,
      String? content,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$ProductItemResCopyWithImpl<$Res, $Val extends ProductItemRes>
    implements $ProductItemResCopyWith<$Res> {
  _$ProductItemResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? assignee = freezed,
    Object? content = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductItemResImplCopyWith<$Res>
    implements $ProductItemResCopyWith<$Res> {
  factory _$$ProductItemResImplCopyWith(_$ProductItemResImpl value,
          $Res Function(_$ProductItemResImpl) then) =
      __$$ProductItemResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? assignee,
      String? content,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$ProductItemResImplCopyWithImpl<$Res>
    extends _$ProductItemResCopyWithImpl<$Res, _$ProductItemResImpl>
    implements _$$ProductItemResImplCopyWith<$Res> {
  __$$ProductItemResImplCopyWithImpl(
      _$ProductItemResImpl _value, $Res Function(_$ProductItemResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? assignee = freezed,
    Object? content = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ProductItemResImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemResImpl implements _ProductItemRes {
  const _$ProductItemResImpl(
      {required this.title,
      this.assignee,
      this.content,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$ProductItemResImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemResImplFromJson(json);

  @override
  final String title;
  @override
  final String? assignee;
  @override
  final String? content;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProductItemRes(title: $title, assignee: $assignee, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemResImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, assignee, content, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemResImplCopyWith<_$ProductItemResImpl> get copyWith =>
      __$$ProductItemResImplCopyWithImpl<_$ProductItemResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemResImplToJson(
      this,
    );
  }
}

abstract class _ProductItemRes implements ProductItemRes {
  const factory _ProductItemRes(
          {required final String title,
          final String? assignee,
          final String? content,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$ProductItemResImpl;

  factory _ProductItemRes.fromJson(Map<String, dynamic> json) =
      _$ProductItemResImpl.fromJson;

  @override
  String get title;
  @override
  String? get assignee;
  @override
  String? get content;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemResImplCopyWith<_$ProductItemResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
