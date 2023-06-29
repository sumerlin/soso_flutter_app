import 'dart:convert';

import '../generated/json/LoginParams.g.dart';
import '../generated/json/base/json_field.dart';

@JsonSerializable()
class LoginParams {
  String? username;
  String? password;
  LoginParams();

  factory LoginParams.fromJson(Map<String, dynamic> json) => $LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => $LoginParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }


}