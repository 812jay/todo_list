import 'package:appflowy_board/appflowy_board.dart';
import 'package:todo_list/app/domain/product/views/widgets/product_item.dart';
import 'package:todo_list/app/domain/user/models/user_model.dart';

class DummyData {
  static UserModel user1 = UserModel(name: 'John Doe');
  static UserModel user2 = UserModel(name: 'Jack');

  //그룹 데이터
  static AppFlowyGroupData group1 = AppFlowyGroupData(
    id: "할 일",
    items: [
      ProductItem(
        title: "사용별 접근 데이터 제한",
        manager: user1,
        createAt: DateTime.now(),
        updateteAt: DateTime.now(),
        content: '',
      ),
      ProductItem(
        title: "사용별 접근 데이터 제한2",
        createAt: DateTime.now(),
        updateteAt: DateTime.now(),
        content: '',
      ),
    ],
    name: '할 일',
  );
  static AppFlowyGroupData group2 = AppFlowyGroupData(
    id: "급한 일",
    items: [
      ProductItem(
        title: 'title',
        manager: UserModel(name: 'name'),
        createAt: DateTime.now(),
        updateteAt: DateTime.now(),
      ),
    ],
    name: "급한 일",
  );
  static AppFlowyGroupData group3 = AppFlowyGroupData(
    id: "진행 중",
    items: [],
    name: "진행 중",
  );
  static AppFlowyGroupData group4 = AppFlowyGroupData(
    id: "완료한 일",
    items: [],
    name: "완료한 일",
  );
}
