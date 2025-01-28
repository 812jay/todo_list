import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/dummy_data.dart';

class ProductService extends GetxService {
  Future<List<ProductRes>> fetchProductList() async {
    List<ProductRes> result = [];
    final groupData = DummyData.groupList;
    for (var group in groupData) {
      result = [...result, ProductRes.fromJson(group)];
    }
    return result;
  }
}
