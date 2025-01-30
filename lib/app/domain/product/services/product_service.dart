import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_list/app/domain/product/models/product/product.dart';
import 'package:todo_list/core/utils/dummy_data.dart';

class ProductService extends GetxService {
  Future<List<ProductRes>> fetchProductList() async {
    try {
      // 결과를 담을 리스트 초기화
      List<ProductRes> result = [];
      final groupData = DummyData.productList;
      // 각 상품 데이터를 ProductRes 모델로 변환
      for (var group in groupData) {
        result = [...result, ProductRes.fromJson(group)];
      }
      return result;
    } catch (e) {
      // 에러 발생 시 빈 리스트 반환
      return [];
    }
  }
}
