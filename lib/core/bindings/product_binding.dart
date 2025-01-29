import 'package:get/get.dart';
import 'package:todo_list/app/domain/product/controllers/product_controller.dart';
import 'package:todo_list/app/domain/product/services/product_service.dart';
import 'package:todo_list/app/domain/user/services/user_services.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    //controller
    Get.lazyPut(() => ProductController(Get.find(), Get.find()), fenix: true);
    //service
    Get.lazyPut(() => UserService(), fenix: true);
    Get.lazyPut(() => ProductService(), fenix: true);
  }
}
