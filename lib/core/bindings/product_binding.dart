import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/controllers/product_controller.dart';
import 'package:todo_list/app/domain/product/services/product_service.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductService(), fenix: true);
    Get.lazyPut(() => ProductController(Get.find()), fenix: true);
  }
}
