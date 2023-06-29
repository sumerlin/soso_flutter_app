import 'package:flutter_app/test_mvvm/UserListModel.dart';
import 'package:flutter_app/test_mvvm/MvvmHomeRepository.dart';
import 'package:get/get.dart';

import 'MvvmStatus.dart';

class MvvmHomeController extends GetxController {
  final _repository = MvvmHomeRepository();

  //维护数据状态
  //可观察数据
  final _userListModel = UserListModel().obs;

  //执行进度状态
  final _status = Status.LOADING.obs;

  Status get status => _status.value;

  void showError() => _status.value = Status.ERROR;
  void showErrorOther()=>_status.value = Status.UNNETWORK;

  UserListModel get userListModel => _userListModel.value;

  //模拟网络获取数据
  void loadUserList() {
    _repository.userListApi().then(
      (value) {
        _userListModel.value = value;
        _status.value = Status.COMPLETED;
      },
    ).onError((error, stackTrace) {
      _status.value = Status.ERROR;
    });
    // .then((value) => Future.delayed(Duration(seconds: 3), () {
    //   _status.value = Status.ERROR;
    // }));
  }

  void reloadUserList(){
    _status.value = Status.LOADING;
    loadUserList();
  }

  void textData() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        List<Data> dataList = [];
        for (int i = 0; i < 20; i++) {
          dataList.add(Data(firstName: "summer"));
        }
        _userListModel.value = new UserListModel(data: dataList);
        print("object");
      },
    );
  }
}
