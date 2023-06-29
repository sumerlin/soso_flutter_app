import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/module_video/model_video/index_response_entity.dart';

IndexResponseEntity $IndexResponseEntityFromJson(Map<String, dynamic> json) {
	final IndexResponseEntity indexResponseEntity = IndexResponseEntity();
	final String? requestId = jsonConvert.convert<String>(json['requestId']);
	if (requestId != null) {
		indexResponseEntity.requestId = requestId;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		indexResponseEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		indexResponseEntity.msg = msg;
	}
	final dynamic recordsTotal = jsonConvert.convert<dynamic>(json['recordsTotal']);
	if (recordsTotal != null) {
		indexResponseEntity.recordsTotal = recordsTotal;
	}
	final IndexResponseData? data = jsonConvert.convert<IndexResponseData>(json['data']);
	if (data != null) {
		indexResponseEntity.data = data;
	}
	return indexResponseEntity;
}

Map<String, dynamic> $IndexResponseEntityToJson(IndexResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['requestId'] = entity.requestId;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['recordsTotal'] = entity.recordsTotal;
	data['data'] = entity.data.toJson();
	return data;
}

IndexResponseData $IndexResponseDataFromJson(Map<String, dynamic> json) {
	final IndexResponseData indexResponseData = IndexResponseData();
	final IndexResponseDataTop? top = jsonConvert.convert<IndexResponseDataTop>(json['top']);
	if (top != null) {
		indexResponseData.top = top;
	}
	final bool? isEnd = jsonConvert.convert<bool>(json['isEnd']);
	if (isEnd != null) {
		indexResponseData.isEnd = isEnd;
	}
	final List<IndexResponseDataSections>? sections = jsonConvert.convertListNotNull<IndexResponseDataSections>(json['sections']);
	if (sections != null) {
		indexResponseData.sections = sections;
	}
	return indexResponseData;
}

Map<String, dynamic> $IndexResponseDataToJson(IndexResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['top'] = entity.top.toJson();
	data['isEnd'] = entity.isEnd;
	data['sections'] =  entity.sections.map((v) => v.toJson()).toList();
	return data;
}

IndexResponseDataTop $IndexResponseDataTopFromJson(Map<String, dynamic> json) {
	final IndexResponseDataTop indexResponseDataTop = IndexResponseDataTop();
	final List<IndexResponseDataTopEye>? eye = jsonConvert.convertListNotNull<IndexResponseDataTopEye>(json['eye']);
	if (eye != null) {
		indexResponseDataTop.eye = eye;
	}
	final List<IndexResponseDataTopGuide>? guide = jsonConvert.convertListNotNull<IndexResponseDataTopGuide>(json['guide']);
	if (guide != null) {
		indexResponseDataTop.guide = guide;
	}
	return indexResponseDataTop;
}

Map<String, dynamic> $IndexResponseDataTopToJson(IndexResponseDataTop entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['eye'] =  entity.eye.map((v) => v.toJson()).toList();
	data['guide'] =  entity.guide.map((v) => v.toJson()).toList();
	return data;
}

IndexResponseDataTopEye $IndexResponseDataTopEyeFromJson(Map<String, dynamic> json) {
	final IndexResponseDataTopEye indexResponseDataTopEye = IndexResponseDataTopEye();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexResponseDataTopEye.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		indexResponseDataTopEye.name = name;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		indexResponseDataTopEye.title = title;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		indexResponseDataTopEye.imgUrl = imgUrl;
	}
	final String? targetUrl = jsonConvert.convert<String>(json['targetUrl']);
	if (targetUrl != null) {
		indexResponseDataTopEye.targetUrl = targetUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		indexResponseDataTopEye.type = type;
	}
	final int? sequence = jsonConvert.convert<int>(json['sequence']);
	if (sequence != null) {
		indexResponseDataTopEye.sequence = sequence;
	}
	final String? redirectUrl = jsonConvert.convert<String>(json['redirectUrl']);
	if (redirectUrl != null) {
		indexResponseDataTopEye.redirectUrl = redirectUrl;
	}
	final String? position = jsonConvert.convert<String>(json['position']);
	if (position != null) {
		indexResponseDataTopEye.position = position;
	}
	final String? filmSubtitle = jsonConvert.convert<String>(json['filmSubtitle']);
	if (filmSubtitle != null) {
		indexResponseDataTopEye.filmSubtitle = filmSubtitle;
	}
	final String? filmTitle = jsonConvert.convert<String>(json['filmTitle']);
	if (filmTitle != null) {
		indexResponseDataTopEye.filmTitle = filmTitle;
	}
	final double? filmScore = jsonConvert.convert<double>(json['filmScore']);
	if (filmScore != null) {
		indexResponseDataTopEye.filmScore = filmScore;
	}
	return indexResponseDataTopEye;
}

Map<String, dynamic> $IndexResponseDataTopEyeToJson(IndexResponseDataTopEye entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['imgUrl'] = entity.imgUrl;
	data['targetUrl'] = entity.targetUrl;
	data['type'] = entity.type;
	data['sequence'] = entity.sequence;
	data['redirectUrl'] = entity.redirectUrl;
	data['position'] = entity.position;
	data['filmSubtitle'] = entity.filmSubtitle;
	data['filmTitle'] = entity.filmTitle;
	data['filmScore'] = entity.filmScore;
	return data;
}

IndexResponseDataTopGuide $IndexResponseDataTopGuideFromJson(Map<String, dynamic> json) {
	final IndexResponseDataTopGuide indexResponseDataTopGuide = IndexResponseDataTopGuide();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexResponseDataTopGuide.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		indexResponseDataTopGuide.name = name;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		indexResponseDataTopGuide.title = title;
	}
	final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
	if (imgUrl != null) {
		indexResponseDataTopGuide.imgUrl = imgUrl;
	}
	final String? targetUrl = jsonConvert.convert<String>(json['targetUrl']);
	if (targetUrl != null) {
		indexResponseDataTopGuide.targetUrl = targetUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		indexResponseDataTopGuide.type = type;
	}
	final int? sequence = jsonConvert.convert<int>(json['sequence']);
	if (sequence != null) {
		indexResponseDataTopGuide.sequence = sequence;
	}
	final String? redirectUrl = jsonConvert.convert<String>(json['redirectUrl']);
	if (redirectUrl != null) {
		indexResponseDataTopGuide.redirectUrl = redirectUrl;
	}
	final String? position = jsonConvert.convert<String>(json['position']);
	if (position != null) {
		indexResponseDataTopGuide.position = position;
	}
	final String? filmSubtitle = jsonConvert.convert<String>(json['filmSubtitle']);
	if (filmSubtitle != null) {
		indexResponseDataTopGuide.filmSubtitle = filmSubtitle;
	}
	final String? filmTitle = jsonConvert.convert<String>(json['filmTitle']);
	if (filmTitle != null) {
		indexResponseDataTopGuide.filmTitle = filmTitle;
	}
	final double? filmScore = jsonConvert.convert<double>(json['filmScore']);
	if (filmScore != null) {
		indexResponseDataTopGuide.filmScore = filmScore;
	}
	return indexResponseDataTopGuide;
}

Map<String, dynamic> $IndexResponseDataTopGuideToJson(IndexResponseDataTopGuide entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['imgUrl'] = entity.imgUrl;
	data['targetUrl'] = entity.targetUrl;
	data['type'] = entity.type;
	data['sequence'] = entity.sequence;
	data['redirectUrl'] = entity.redirectUrl;
	data['position'] = entity.position;
	data['filmSubtitle'] = entity.filmSubtitle;
	data['filmTitle'] = entity.filmTitle;
	data['filmScore'] = entity.filmScore;
	return data;
}

IndexResponseDataSections $IndexResponseDataSectionsFromJson(Map<String, dynamic> json) {
	final IndexResponseDataSections indexResponseDataSections = IndexResponseDataSections();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexResponseDataSections.id = id;
	}
	final String? display = jsonConvert.convert<String>(json['display']);
	if (display != null) {
		indexResponseDataSections.display = display;
	}
	final String? moreText = jsonConvert.convert<String>(json['moreText']);
	if (moreText != null) {
		indexResponseDataSections.moreText = moreText;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		indexResponseDataSections.name = name;
	}
	final int? position = jsonConvert.convert<int>(json['position']);
	if (position != null) {
		indexResponseDataSections.position = position;
	}
	final String? sectionType = jsonConvert.convert<String>(json['sectionType']);
	if (sectionType != null) {
		indexResponseDataSections.sectionType = sectionType;
	}
	final int? sequence = jsonConvert.convert<int>(json['sequence']);
	if (sequence != null) {
		indexResponseDataSections.sequence = sequence;
	}
	final String? targetId = jsonConvert.convert<String>(json['targetId']);
	if (targetId != null) {
		indexResponseDataSections.targetId = targetId;
	}
	final dynamic targetType = jsonConvert.convert<dynamic>(json['targetType']);
	if (targetType != null) {
		indexResponseDataSections.targetType = targetType;
	}
	final String? displayTitle = jsonConvert.convert<String>(json['displayTitle']);
	if (displayTitle != null) {
		indexResponseDataSections.displayTitle = displayTitle;
	}
	final List<IndexResponseDataSectionsSectionContents>? sectionContents = jsonConvert.convertListNotNull<IndexResponseDataSectionsSectionContents>(json['sectionContents']);
	if (sectionContents != null) {
		indexResponseDataSections.sectionContents = sectionContents;
	}
	final dynamic startTime = jsonConvert.convert<dynamic>(json['startTime']);
	if (startTime != null) {
		indexResponseDataSections.startTime = startTime;
	}
	final dynamic endTime = jsonConvert.convert<dynamic>(json['endTime']);
	if (endTime != null) {
		indexResponseDataSections.endTime = endTime;
	}
	return indexResponseDataSections;
}

Map<String, dynamic> $IndexResponseDataSectionsToJson(IndexResponseDataSections entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['display'] = entity.display;
	data['moreText'] = entity.moreText;
	data['name'] = entity.name;
	data['position'] = entity.position;
	data['sectionType'] = entity.sectionType;
	data['sequence'] = entity.sequence;
	data['targetId'] = entity.targetId;
	data['targetType'] = entity.targetType;
	data['displayTitle'] = entity.displayTitle;
	data['sectionContents'] =  entity.sectionContents.map((v) => v.toJson()).toList();
	data['startTime'] = entity.startTime;
	data['endTime'] = entity.endTime;
	return data;
}

IndexResponseDataSectionsSectionContents $IndexResponseDataSectionsSectionContentsFromJson(Map<String, dynamic> json) {
	final IndexResponseDataSectionsSectionContents indexResponseDataSectionsSectionContents = IndexResponseDataSectionsSectionContents();
	final int? dramaId = jsonConvert.convert<int>(json['dramaId']);
	if (dramaId != null) {
		indexResponseDataSectionsSectionContents.dramaId = dramaId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		indexResponseDataSectionsSectionContents.title = title;
	}
	final String? subTitle = jsonConvert.convert<String>(json['subTitle']);
	if (subTitle != null) {
		indexResponseDataSectionsSectionContents.subTitle = subTitle;
	}
	final String? coverUrl = jsonConvert.convert<String>(json['coverUrl']);
	if (coverUrl != null) {
		indexResponseDataSectionsSectionContents.coverUrl = coverUrl;
	}
	final String? dramaType = jsonConvert.convert<String>(json['dramaType']);
	if (dramaType != null) {
		indexResponseDataSectionsSectionContents.dramaType = dramaType;
	}
	final double? score = jsonConvert.convert<double>(json['score']);
	if (score != null) {
		indexResponseDataSectionsSectionContents.score = score;
	}
	final dynamic feeMode = jsonConvert.convert<dynamic>(json['feeMode']);
	if (feeMode != null) {
		indexResponseDataSectionsSectionContents.feeMode = feeMode;
	}
	final dynamic favorite = jsonConvert.convert<dynamic>(json['favorite']);
	if (favorite != null) {
		indexResponseDataSectionsSectionContents.favorite = favorite;
	}
	final dynamic count = jsonConvert.convert<dynamic>(json['count']);
	if (count != null) {
		indexResponseDataSectionsSectionContents.count = count;
	}
	final bool? vipFlag = jsonConvert.convert<bool>(json['vipFlag']);
	if (vipFlag != null) {
		indexResponseDataSectionsSectionContents.vipFlag = vipFlag;
	}
	return indexResponseDataSectionsSectionContents;
}

Map<String, dynamic> $IndexResponseDataSectionsSectionContentsToJson(IndexResponseDataSectionsSectionContents entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['dramaId'] = entity.dramaId;
	data['title'] = entity.title;
	data['subTitle'] = entity.subTitle;
	data['coverUrl'] = entity.coverUrl;
	data['dramaType'] = entity.dramaType;
	data['score'] = entity.score;
	data['feeMode'] = entity.feeMode;
	data['favorite'] = entity.favorite;
	data['count'] = entity.count;
	data['vipFlag'] = entity.vipFlag;
	return data;
}