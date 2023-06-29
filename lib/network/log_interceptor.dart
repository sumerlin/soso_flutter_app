
import 'package:dio/dio.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

class LoggerInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print("\n||================================= 请求数据 =================================");
    print("|| method = ${options.method.toString()}");
    print("|| url = ${options.uri.toString()}");
    print("|| headers = ${options.headers}");
    print("|| params = ${options.queryParameters}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    print("\n||请求结果：");
    print("|| response.statusCode = ${response.statusCode}");
    print("|| response.data = ${response.data}");
    print("||================================= 请求结束 =================================\n");
    // logger(response.data);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
    print("\n=================================错误响应数据 =================================");
    print("|| type = ${err.type}");
    print("|| message = ${err.message}");
    print("|| stackTrace = ${err.stackTrace}");
    print("\n");
  }

}