import 'UserListModel.dart';
import 'net/NetUrl.dart';
import 'net/NetworkApiServices.dart';

class MvvmHomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic result = await _apiServices.getApi(NetUrl.userListApi);
    return UserListModel.fromJson(result);
  }
}
