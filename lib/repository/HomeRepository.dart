import 'package:flutter_app/model/category_entity.dart';

import '../config/AppNetConfig.dart';
import '../model/HomeModel.dart';
import '../model/category_data_model.dart';
import '../model/home_data_model.dart';
import '../network/api_response/api_response_entity.dart';
import '../network/request.dart';
import '../network/request_network.dart';
import '../network_test/dio_manager.dart';

class HomeRepository {
  Future<HomeDataModel> homeDataApi_old() async {
    return await DioManager.instance.getBanner(AppNetConfig.homeUrl);
  }

  Future<HomeModel?> homeDataApi() async {
    // return await DioManager.instance.getBanner(AppNetConfig.homeUrl);
    var result = await requestNetwork.get<HomeModel>(AppNetConfig.homeUrl,
        onResponse: (ApiResponse<HomeModel> response) {});
    return result;
  }

  Future<CategoryDataModel> categoryDataApi_old() async {
    return await DioManager.instance.getCategory(AppNetConfig.categoryUrl);
  }

  Future<CategoryEntity?> categoryDataApi() async {
    var result = await requestNetwork.get<CategoryEntity>(AppNetConfig.categoryUrl,
        onResponse: (ApiResponse<CategoryEntity> response) {});
    return result;
  }



}
