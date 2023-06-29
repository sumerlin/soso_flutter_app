import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/category_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CategoryListEntity {
	late String requestId;
	late String code;
	late String msg;
	late int recordsTotal;
	late List<CategoryListData> data;

	CategoryListEntity();

	factory CategoryListEntity.fromJson(Map<String, dynamic> json) => $CategoryListEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryListData {
	late int dramaId;
	late String dramaType;
	late String title;
	late String score;
	late int seasonNo;
	late String coverUrl;
	dynamic cover3Url;
	late bool vipFlag;
	late String alias;
	late String year;
	late String producerRegion;
	late String plotType;
	dynamic actor;
	late String subTitle;
	dynamic coverUrlInfo;
	dynamic cover3UrlInfo;
	late String episodeInfo;

	CategoryListData();

	factory CategoryListData.fromJson(Map<String, dynamic> json) => $CategoryListDataFromJson(json);

	Map<String, dynamic> toJson() => $CategoryListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}