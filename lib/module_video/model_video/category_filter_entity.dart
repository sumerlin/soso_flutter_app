import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/category_filter_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CategoryFilterEntity {
	late String requestId;
	late String code;
	late String msg;
	dynamic recordsTotal;
	late List<CategoryFilterData> data;

	CategoryFilterEntity();

	factory CategoryFilterEntity.fromJson(Map<String, dynamic> json) => $CategoryFilterEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryFilterEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryFilterData {
	late String filterType;
	late List<CategoryFilterDataDramaFilterItemList> dramaFilterItemList;

	CategoryFilterData();

	factory CategoryFilterData.fromJson(Map<String, dynamic> json) => $CategoryFilterDataFromJson(json);

	Map<String, dynamic> toJson() => $CategoryFilterDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryFilterDataDramaFilterItemList {
	late String displayName;
	late String value;

	CategoryFilterDataDramaFilterItemList();

	factory CategoryFilterDataDramaFilterItemList.fromJson(Map<String, dynamic> json) => $CategoryFilterDataDramaFilterItemListFromJson(json);

	Map<String, dynamic> toJson() => $CategoryFilterDataDramaFilterItemListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}