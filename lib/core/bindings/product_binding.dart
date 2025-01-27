import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/controllers/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
  }
}
