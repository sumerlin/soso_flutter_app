import 'dart:convert';

import 'package:flutter_app/model/UserEntity.dart';
import 'package:flutter_app/network/request_network.dart';

import '../model/LoginParams.dart';
import '../network/api_response/api_response_entity.dart';
import '../network/request.dart';

class DioController {
  static const login = "/login";
  void loginTest() {
    request(() async {
      LoginParams params = LoginParams();
      params.username = "loongwind";
      params.password = "123456";
      UserEntity? user = await requestNetwork.post<UserEntity>(login, data: params,
          onResponse: (ApiResponse<UserEntity> response) {
        print("====response:$response");
      });

      print("=====user:$user");
    });
  }
}

