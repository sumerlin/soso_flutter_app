import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/module_video/model_video/category_filter_entity.dart';

CategoryFilterEntity $CategoryFilterEntityFromJson(Map<String, dynamic> json) {
	final CategoryFilterEntity categoryFilterEntity = CategoryFilterEntity();
	final String? requestId = jsonConvert.convert<String>(json['requestId']);
	if (requestId != null) {
		categoryFilterEntity.requestId = requestId;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		categoryFilterEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		categoryFilterEntity.msg = msg;
	}
	final dynamic recordsTotal = jsonConvert.convert<dynamic>(json['recordsTotal']);
	if (recordsTotal != null) {
		categoryFilterEntity.recordsTotal = recordsTotal;
	}
	final List<CategoryFilterData>? data = jsonConvert.convertListNotNull<CategoryFilterData>(json['data']);
	if (data != null) {
		categoryFilterEntity.data = data;
	}
	return categoryFilterEntity;
}

Map<String, dynamic> $CategoryFilterEntityToJson(CategoryFilterEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['requestId'] = entity.requestId;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['recordsTotal'] = entity.recordsTotal;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	return data;
}

CategoryFilterData $CategoryFilterDataFromJson(Map<String, dynamic> json) {
	final CategoryFilterData categoryFilterData = CategoryFilterData();
	final String? filterType = jsonConvert.convert<String>(json['filterType']);
	if (filterType != null) {
		categoryFilterData.filterType = filterType;
	}
	final List<CategoryFilterDataDramaFilterItemList>? dramaFilterItemList = jsonConvert.convertListNotNull<CategoryFilterDataDramaFilterItemList>(json['dramaFilterItemList']);
	if (dramaFilterItemList != null) {
		categoryFilterData.dramaFilterItemList = dramaFilterItemList;
	}
	return categoryFilterData;
}

Map<String, dynamic> $CategoryFilterDataToJson(CategoryFilterData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['filterType'] = entity.filterType;
	data['dramaFilterItemList'] =  entity.dramaFilterItemList.map((v) => v.toJson()).toList();
	return data;
}

CategoryFilterDataDramaFilterItemList $CategoryFilterDataDramaFilterItemListFromJson(Map<String, dynamic> json) {
	final CategoryFilterDataDramaFilterItemList categoryFilterDataDramaFilterItemList = CategoryFilterDataDramaFilterItemList();
	final String? displayName = jsonConvert.convert<String>(json['displayName']);
	if (displayName != null) {
		categoryFilterDataDramaFilterItemList.displayName = displayName;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		categoryFilterDataDramaFilterItemList.value = value;
	}
	return categoryFilterDataDramaFilterItemList;
}

Map<String, dynamic> $CategoryFilterDataDramaFilterItemListToJson(CategoryFilterDataDramaFilterItemList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['displayName'] = entity.displayName;
	data['value'] = entity.value;
	return data;
}