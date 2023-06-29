import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/category_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CategoryModelEntity {
	@JSONField(name: "current_page")
	int? currentPage = 0;
	List<CategoryModelData>? data;
	@JSONField(name: "first_page_url")
	String? firstPageUrl = '';
	int? from = 0;
	@JSONField(name: "last_page")
	int? lastPage = 0;
	@JSONField(name: "last_page_url")
	String? lastPageUrl = '';
	@JSONField(name: "next_page_url")
	dynamic nextPageUrl;
	String? path = '';
	@JSONField(name: "per_page")
	int? perPage = 0;
	@JSONField(name: "prev_page_url")
	dynamic prevPageUrl;
	int? to = 0;
	int? total = 0;

	CategoryModelEntity();

	factory CategoryModelEntity.fromJson(Map<String, dynamic> json) => $CategoryModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $CategoryModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryModelData {
	int? id = 0;
	String? name = '';
	String? image = '';

	CategoryModelData();

	factory CategoryModelData.fromJson(Map<String, dynamic> json) => $CategoryModelDataFromJson(json);

	Map<String, dynamic> toJson() => $CategoryModelDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}