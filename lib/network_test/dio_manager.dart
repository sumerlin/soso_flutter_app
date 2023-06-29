import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/category_data_model.dart';
import '../model/home_data_model.dart';
import 'MyLogInterceptor.dart';
import 'constant.dart';

class DioManager {
  static final DioManager instance = DioManager._internal();

  factory DioManager() => instance;

  static late Dio dio;

  DioManager._internal() {
    var options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    );
    dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(MyLogInterceptor());
    }
  }

  Future<HomeDataModel> getBanner(String url) async {
    Map<String, dynamic> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '',
      'lang': 'en',
    };
    // dio.options.copyWith(headers: headers);
    // Future<Response<ResultModel>> resulModel =  dio.get(url, options: Options(headers: headers));
    final response = await dio.get<String>(url, options: Options(headers: headers));
    debugPrint('1');
    debugPrint(response.toString());
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      debugPrint('2');
      final data = jsonDecode(response.data??"");
      if (data['status'] == true) {
        debugPrint('get home data success');
        final resposeData = HomeDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get home data field');
        // throw ServerException();
        throw Exception();
      }
    } else {
      debugPrint('3');
      // throw ServerException();
      throw Exception();
    }
  }

  Future<CategoryDataModel> getCategory(String url) async {
    Map<String, dynamic> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '',
      'lang': 'en',
    };
    // dio.options.copyWith(headers: headers);
    // Future<Response<ResultModel>> resulModel =  dio.get(url, options: Options(headers: headers));
    final response = await dio.get<String>(url, options: Options(headers: headers));
    debugPrint('1');
    debugPrint(response.toString());
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      debugPrint('2');
      final data = jsonDecode(response.data??"");
      if (data['status'] == true) {
        debugPrint('get home data success');
        final resposeData = CategoryDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get home data field');
        // throw ServerException();
        throw Exception();
      }
    } else {
      debugPrint('3');
      // throw ServerException();
      throw Exception();
    }
  }



  Future<Map<String, dynamic>> post(String url, params,
      [Function? successCallBack, Function? errorCallBack]) async {
    Response? response;
    try {
      response = await dio.post(url, data: params);
    } catch (error) {
      print('请求异常: ' + error.toString());
      if (errorCallBack != null) {
        errorCallBack(error.toString());
      } else {
        return Map<String, dynamic>();
      }
    }
    // print('请求url: ' + url);
    // print('返回参数: ' + response.toString());
    if (response?.statusCode == 200) {
      Map<String, dynamic> dataMap = json.decode(json.encode(response?.data));
      if (dataMap['status'] == 200) {
        if (successCallBack != null) {
          successCallBack(dataMap['data']);
        } else {
          return dataMap['data'];
        }
      } else {
        if (errorCallBack != null) {
          errorCallBack(dataMap['msg']);
        } else {
          return Map<String, dynamic>();
        }
      }
    } else {
      if (errorCallBack != null) {
        errorCallBack(response.toString());
      } else {
        return Map<String, dynamic>();
      }
    }
    return Map<String, dynamic>();
  }
}
