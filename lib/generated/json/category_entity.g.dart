import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/category_entity.dart';

CategoryEntity $CategoryEntityFromJson(Map<String, dynamic> json) {
	final CategoryEntity categoryEntity = CategoryEntity();
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		categoryEntity.currentPage = currentPage;
	}
	final List<CategoryData>? data = jsonConvert.convertListNotNull<CategoryData>(json['data']);
	if (data != null) {
		categoryEntity.data = data;
	}
	final String? firstPageUrl = jsonConvert.convert<String>(json['first_page_url']);
	if (firstPageUrl != null) {
		categoryEntity.firstPageUrl = firstPageUrl;
	}
	final int? from = jsonConvert.convert<int>(json['from']);
	if (from != null) {
		categoryEntity.from = from;
	}
	final int? lastPage = jsonConvert.convert<int>(json['last_page']);
	if (lastPage != null) {
		categoryEntity.lastPage = lastPage;
	}
	final String? lastPageUrl = jsonConvert.convert<String>(json['last_page_url']);
	if (lastPageUrl != null) {
		categoryEntity.lastPageUrl = lastPageUrl;
	}
	final dynamic nextPageUrl = jsonConvert.convert<dynamic>(json['next_page_url']);
	if (nextPageUrl != null) {
		categoryEntity.nextPageUrl = nextPageUrl;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		categoryEntity.path = path;
	}
	final int? perPage = jsonConvert.convert<int>(json['per_page']);
	if (perPage != null) {
		categoryEntity.perPage = perPage;
	}
	final dynamic prevPageUrl = jsonConvert.convert<dynamic>(json['prev_page_url']);
	if (prevPageUrl != null) {
		categoryEntity.prevPageUrl = prevPageUrl;
	}
	final int? to = jsonConvert.convert<int>(json['to']);
	if (to != null) {
		categoryEntity.to = to;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		categoryEntity.total = total;
	}
	return categoryEntity;
}

Map<String, dynamic> $CategoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current_page'] = entity.currentPage;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	data['first_page_url'] = entity.firstPageUrl;
	data['from'] = entity.from;
	data['last_page'] = entity.lastPage;
	data['last_page_url'] = entity.lastPageUrl;
	data['next_page_url'] = entity.nextPageUrl;
	data['path'] = entity.path;
	data['per_page'] = entity.perPage;
	data['prev_page_url'] = entity.prevPageUrl;
	data['to'] = entity.to;
	data['total'] = entity.total;
	return data;
}

CategoryData $CategoryDataFromJson(Map<String, dynamic> json) {
	final CategoryData categoryData = CategoryData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		categoryData.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		categoryData.name = name;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		categoryData.image = image;
	}
	return categoryData;
}

Map<String, dynamic> $CategoryDataToJson(CategoryData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['image'] = entity.image;
	return data;
}