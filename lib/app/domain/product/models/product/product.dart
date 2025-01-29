import 'package:appflowy_board/appflowy_board.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/helper/datetime_helper.dart';
import 'package:uuid/uuid.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductRes with _$ProductRes {
  const factory ProductRes({
    required String groupTitle,
    List<ProductItemRes>? itemList,
  }) = _ProductRes;

  factory ProductRes.fromJson(Map<String, dynamic> json) =>
      _$ProductResFromJson(json);
}

@freezed
class ProductItemRes with _$ProductItemRes {
  const factory ProductItemRes({
    required String groupTitle,
    required String title,
    UserRes? assignee,
    String? content,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _ProductItemRes;

  factory ProductItemRes.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResFromJson(json);
}

class ParsedProductItemRes extends AppFlowyGroupItem {
  ParsedProductItemRes({
    required this.groupTitle,
    required this.title,
    this.assignee,
    this.content,
    required this.createdAt,
    required this.updatedAt,
  }) : _id = const Uuid().v4();

  final String groupTitle;
  final String title;
  final UserRes? assignee;
  final String? content;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String _id; // 내부에서 유니크 ID 저장

  @override
  String get id => _id;
}
