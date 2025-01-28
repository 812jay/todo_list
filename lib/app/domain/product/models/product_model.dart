import 'package:appflowy_board/appflowy_board.dart';

class ProductRes {
  final String groupTitle;
  final List<ProductItemRes>? itemList;

  ProductRes({
    required this.groupTitle,
    this.itemList,
  });
}

class ProductItemRes {
  final String title;
  final String? assignee;
  final String content;
  final DateTime createAt;
  final DateTime updateteAt;

  ProductItemRes({
    required this.title,
    this.assignee,
    this.content = '',
    required this.createAt,
    required this.updateteAt,
  });
}

class ParsedProductItemRes extends AppFlowyGroupItem {
  ParsedProductItemRes({
    required this.title,
    this.assignee,
    this.content = '',
    required this.createAt,
    required this.updateteAt,
  });
  final String title;
  final String? assignee;
  final String content;
  final DateTime createAt;
  final DateTime updateteAt;
  @override
  String get id => title;
}
