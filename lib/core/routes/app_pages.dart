import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/app/domain/product/views/product_screen.dart';
import 'package:todo_list/core/bindings/product_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/product',
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
  ];
}
