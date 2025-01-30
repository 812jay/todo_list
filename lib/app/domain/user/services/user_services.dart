import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/dummy_data.dart';

class UserService extends GetxService {
  /// 사용자 목록을 가져오는 메서드
  Future<List<UserRes>> fetchUserList() async {
    List<UserRes> result = [];
    // 더미 데이터에서 사용자 데이터 가져오기
    final userData = DummyData.userList;
    // JSON 데이터를 UserRes 객체로 변환
    for (var user in userData) {
      result.add(UserRes.fromJson(user));
    }
    return result;
  }
}
