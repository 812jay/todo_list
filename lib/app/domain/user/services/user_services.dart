import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:todo_list/app/domain/user/models/user.dart';
import 'package:todo_list/core/utils/dummy_data.dart';

class UserService extends GetxService {
  Future<List<UserRes>> fetchUserList() async {
    List<UserRes> result = [];
    final userData = DummyData.userList;
    for (var group in userData) {
      result = [...result, UserRes.fromJson(group)];
    }
    return result;
  }
}
