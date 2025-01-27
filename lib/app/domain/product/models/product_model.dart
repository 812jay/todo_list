import 'package:todo_list/app/domain/user/models/user_model.dart';

class ProductModel {
  final String title;
  final UserModel manager;
  final String content;
  final DateTime createAt;
  final DateTime updateteAt;
  ProductModel({
    required this.title,
    required this.manager,
    this.content = '',
    required this.createAt,
    required this.updateteAt,
  });
}
