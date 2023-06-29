import 'dart:convert';

import '../../generated/json/base/json_field.dart';
import 'api_response_entity.g.dart';

class ApiResponse<T> {
  //todo: 网络测试，正式环境需要修改
  int? code =200;
  bool? status;
  String? message;
  T? data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
