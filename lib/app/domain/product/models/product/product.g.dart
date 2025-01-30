// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductResImpl _$$ProductResImplFromJson(Map<String, dynamic> json) =>
    _$ProductResImpl(
      groupTitle: json['groupTitle'] as String,
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => ProductItemRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductResImplToJson(_$ProductResImpl instance) =>
    <String, dynamic>{
      'groupTitle': instance.groupTitle,
      'itemList': instance.itemList,
    };

_$ProductItemResImpl _$$ProductItemResImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemResImpl(
      groupTitle: json['groupTitle'] as String,
      title: json['title'] as String,
      assignee: json['assignee'] == null
          ? null
          : UserRes.fromJson(json['assignee'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$ProductItemResImplToJson(
        _$ProductItemResImpl instance) =>
    <String, dynamic>{
      'groupTitle': instance.groupTitle,
      'title': instance.title,
      'assignee': instance.assignee,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
