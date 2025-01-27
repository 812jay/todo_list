import 'package:appflowy_board/appflowy_board.dart';
import 'package:todo_list/app/domain/user/models/user_model.dart';

class ProductItem extends AppFlowyGroupItem {
  final String title;
  final UserModel? manager;
  final String content;
  final DateTime createAt;
  final DateTime updateteAt;
  ProductItem({
    required this.title,
    this.manager,
    this.content = '',
    required this.createAt,
    required this.updateteAt,
  });

  @override
  String get id => title;
}
