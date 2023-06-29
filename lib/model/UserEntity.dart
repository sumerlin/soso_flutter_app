

import 'dart:convert';

import '../generated/json/UserEntity.g.dart';
import '../generated/json/base/json_field.dart';

@JsonSerializable()
class UserEntity {
  String? userId;
  String? username;
  int? age;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
  $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
