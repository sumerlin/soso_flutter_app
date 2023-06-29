import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/module_video/model_video/category_list_entity.dart';

CategoryListEntity $CategoryListEntityFromJson(Map<String, dynamic> json) {
	final CategoryListEntity categoryListEntity = CategoryListEntity();
	final String? requestId = jsonConvert.convert<String>(json['requestId']);
	if (requestId != null) {
		categoryListEntity.requestId = requestId;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		categoryListEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		categoryListEntity.msg = msg;
	}
	final int? recordsTotal = jsonConvert.convert<int>(json['recordsTotal']);
	if (recordsTotal != null) {
		categoryListEntity.recordsTotal = recordsTotal;
	}
	final List<CategoryListData>? data = jsonConvert.convertListNotNull<CategoryListData>(json['data']);
	if (data != null) {
		categoryListEntity.data = data;
	}
	return categoryListEntity;
}

Map<String, dynamic> $CategoryListEntityToJson(CategoryListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['requestId'] = entity.requestId;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['recordsTotal'] = entity.recordsTotal;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	return data;
}

CategoryListData $CategoryListDataFromJson(Map<String, dynamic> json) {
	final CategoryListData categoryListData = CategoryListData();
	final int? dramaId = jsonConvert.convert<int>(json['dramaId']);
	if (dramaId != null) {
		categoryListData.dramaId = dramaId;
	}
	final String? dramaType = jsonConvert.convert<String>(json['dramaType']);
	if (dramaType != null) {
		categoryListData.dramaType = dramaType;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		categoryListData.title = title;
	}
	final String? score = jsonConvert.convert<String>(json['score']);
	if (score != null) {
		categoryListData.score = score;
	}
	final int? seasonNo = jsonConvert.convert<int>(json['seasonNo']);
	if (seasonNo != null) {
		categoryListData.seasonNo = seasonNo;
	}
	final String? coverUrl = jsonConvert.convert<String>(json['coverUrl']);
	if (coverUrl != null) {
		categoryListData.coverUrl = coverUrl;
	}
	final dynamic cover3Url = jsonConvert.convert<dynamic>(json['cover3Url']);
	if (cover3Url != null) {
		categoryListData.cover3Url = cover3Url;
	}
	final bool? vipFlag = jsonConvert.convert<bool>(json['vipFlag']);
	if (vipFlag != null) {
		categoryListData.vipFlag = vipFlag;
	}
	final String? alias = jsonConvert.convert<String>(json['alias']);
	if (alias != null) {
		categoryListData.alias = alias;
	}
	final String? year = jsonConvert.convert<String>(json['year']);
	if (year != null) {
		categoryListData.year = year;
	}
	final String? producerRegion = jsonConvert.convert<String>(json['producerRegion']);
	if (producerRegion != null) {
		categoryListData.producerRegion = producerRegion;
	}
	final String? plotType = jsonConvert.convert<String>(json['plotType']);
	if (plotType != null) {
		categoryListData.plotType = plotType;
	}
	final dynamic actor = jsonConvert.convert<dynamic>(json['actor']);
	if (actor != null) {
		categoryListData.actor = actor;
	}
	final String? subTitle = jsonConvert.convert<String>(json['subTitle']);
	if (subTitle != null) {
		categoryListData.subTitle = subTitle;
	}
	final dynamic coverUrlInfo = jsonConvert.convert<dynamic>(json['coverUrlInfo']);
	if (coverUrlInfo != null) {
		categoryListData.coverUrlInfo = coverUrlInfo;
	}
	final dynamic cover3UrlInfo = jsonConvert.convert<dynamic>(json['cover3UrlInfo']);
	if (cover3UrlInfo != null) {
		categoryListData.cover3UrlInfo = cover3UrlInfo;
	}
	final String? episodeInfo = jsonConvert.convert<String>(json['episodeInfo']);
	if (episodeInfo != null) {
		categoryListData.episodeInfo = episodeInfo;
	}
	return categoryListData;
}

Map<String, dynamic> $CategoryListDataToJson(CategoryListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['dramaId'] = entity.dramaId;
	data['dramaType'] = entity.dramaType;
	data['title'] = entity.title;
	data['score'] = entity.score;
	data['seasonNo'] = entity.seasonNo;
	data['coverUrl'] = entity.coverUrl;
	data['cover3Url'] = entity.cover3Url;
	data['vipFlag'] = entity.vipFlag;
	data['alias'] = entity.alias;
	data['year'] = entity.year;
	data['producerRegion'] = entity.producerRegion;
	data['plotType'] = entity.plotType;
	data['actor'] = entity.actor;
	data['subTitle'] = entity.subTitle;
	data['coverUrlInfo'] = entity.coverUrlInfo;
	data['cover3UrlInfo'] = entity.cover3UrlInfo;
	data['episodeInfo'] = entity.episodeInfo;
	return data;
}