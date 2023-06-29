import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/category_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CategoryEntity {
	@JSONField(name: "current_page")
	late int currentPage = 0;
	late List<CategoryData> data;
	@JSONField(name: "first_page_url")
	late String firstPageUrl = '';
	late int from = 0;
	@JSONField(name: "last_page")
	late int lastPage = 0;
	@JSONField(name: "last_page_url")
	late String lastPageUrl = '';
	@JSONField(name: "next_page_url")
	dynamic nextPageUrl;
	late String path = '';
	@JSONField(name: "per_page")
	late int perPage = 0;
	@JSONField(name: "prev_page_url")
	dynamic prevPageUrl;
	late int to = 0;
	late int total = 0;

	CategoryEntity();

	factory CategoryEntity.fromJson(Map<String, dynamic> json) => $CategoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryData {
	late int id = 0;
	late String name = '';
	late String image = '';

	CategoryData();

	factory CategoryData.fromJson(Map<String, dynamic> json) => $CategoryDataFromJson(json);

	Map<String, dynamic> toJson() => $CategoryDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}