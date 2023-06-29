import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/category_model_entity.dart';

CategoryModelEntity $CategoryModelEntityFromJson(Map<String, dynamic> json) {
	final CategoryModelEntity categoryModelEntity = CategoryModelEntity();
	final int? currentPage = jsonConvert.convert<int>(json['current_page']);
	if (currentPage != null) {
		categoryModelEntity.currentPage = currentPage;
	}
	final List<CategoryModelData>? data = jsonConvert.convertListNotNull<CategoryModelData>(json['data']);
	if (data != null) {
		categoryModelEntity.data = data;
	}
	final String? firstPageUrl = jsonConvert.convert<String>(json['first_page_url']);
	if (firstPageUrl != null) {
		categoryModelEntity.firstPageUrl = firstPageUrl;
	}
	final int? from = jsonConvert.convert<int>(json['from']);
	if (from != null) {
		categoryModelEntity.from = from;
	}
	final int? lastPage = jsonConvert.convert<int>(json['last_page']);
	if (lastPage != null) {
		categoryModelEntity.lastPage = lastPage;
	}
	final String? lastPageUrl = jsonConvert.convert<String>(json['last_page_url']);
	if (lastPageUrl != null) {
		categoryModelEntity.lastPageUrl = lastPageUrl;
	}
	final dynamic nextPageUrl = jsonConvert.convert<dynamic>(json['next_page_url']);
	if (nextPageUrl != null) {
		categoryModelEntity.nextPageUrl = nextPageUrl;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		categoryModelEntity.path = path;
	}
	final int? perPage = jsonConvert.convert<int>(json['per_page']);
	if (perPage != null) {
		categoryModelEntity.perPage = perPage;
	}
	final dynamic prevPageUrl = jsonConvert.convert<dynamic>(json['prev_page_url']);
	if (prevPageUrl != null) {
		categoryModelEntity.prevPageUrl = prevPageUrl;
	}
	final int? to = jsonConvert.convert<int>(json['to']);
	if (to != null) {
		categoryModelEntity.to = to;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		categoryModelEntity.total = total;
	}
	return categoryModelEntity;
}

Map<String, dynamic> $CategoryModelEntityToJson(CategoryModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current_page'] = entity.currentPage;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
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

CategoryModelData $CategoryModelDataFromJson(Map<String, dynamic> json) {
	final CategoryModelData categoryModelData = CategoryModelData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		categoryModelData.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		categoryModelData.name = name;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		categoryModelData.image = image;
	}
	return categoryModelData;
}

Map<String, dynamic> $CategoryModelDataToJson(CategoryModelData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['image'] = entity.image;
	return data;
}