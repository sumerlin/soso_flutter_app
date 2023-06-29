import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/module_video/model_video/good_look_entity.dart';

GoodLookEntity $GoodLookEntityFromJson(Map<String, dynamic> json) {
	final GoodLookEntity goodLookEntity = GoodLookEntity();
	final int? errno = jsonConvert.convert<int>(json['errno']);
	if (errno != null) {
		goodLookEntity.errno = errno;
	}
	final String? errmsg = jsonConvert.convert<String>(json['errmsg']);
	if (errmsg != null) {
		goodLookEntity.errmsg = errmsg;
	}
	final String? logid = jsonConvert.convert<String>(json['logid']);
	if (logid != null) {
		goodLookEntity.logid = logid;
	}
	final GoodLookData? data = jsonConvert.convert<GoodLookData>(json['data']);
	if (data != null) {
		goodLookEntity.data = data;
	}
	return goodLookEntity;
}

Map<String, dynamic> $GoodLookEntityToJson(GoodLookEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['errno'] = entity.errno;
	data['errmsg'] = entity.errmsg;
	data['logid'] = entity.logid;
	data['data'] = entity.data.toJson();
	return data;
}

GoodLookData $GoodLookDataFromJson(Map<String, dynamic> json) {
	final GoodLookData goodLookData = GoodLookData();
	final GoodLookDataResponse? response = jsonConvert.convert<GoodLookDataResponse>(json['response']);
	if (response != null) {
		goodLookData.response = response;
	}
	return goodLookData;
}

Map<String, dynamic> $GoodLookDataToJson(GoodLookData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['response'] = entity.response.toJson();
	return data;
}

GoodLookDataResponse $GoodLookDataResponseFromJson(Map<String, dynamic> json) {
	final GoodLookDataResponse goodLookDataResponse = GoodLookDataResponse();
	final List<GoodLookDataResponsePageData>? pageData = jsonConvert.convertListNotNull<GoodLookDataResponsePageData>(json['page_data']);
	if (pageData != null) {
		goodLookDataResponse.pageData = pageData;
	}
	final int? hasMore = jsonConvert.convert<int>(json['has_more']);
	if (hasMore != null) {
		goodLookDataResponse.hasMore = hasMore;
	}
	return goodLookDataResponse;
}

Map<String, dynamic> $GoodLookDataResponseToJson(GoodLookDataResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['page_data'] =  entity.pageData.map((v) => v.toJson()).toList();
	data['has_more'] = entity.hasMore;
	return data;
}

GoodLookDataResponsePageData $GoodLookDataResponsePageDataFromJson(Map<String, dynamic> json) {
	final GoodLookDataResponsePageData goodLookDataResponsePageData = GoodLookDataResponsePageData();
	final String? videoName = jsonConvert.convert<String>(json['videoName']);
	if (videoName != null) {
		goodLookDataResponsePageData.videoName = videoName;
	}
	final String? verticalImage = jsonConvert.convert<String>(json['verticalImage']);
	if (verticalImage != null) {
		goodLookDataResponsePageData.verticalImage = verticalImage;
	}
	final String? seriesNum = jsonConvert.convert<String>(json['seriesNum']);
	if (seriesNum != null) {
		goodLookDataResponsePageData.seriesNum = seriesNum;
	}
	final String? introduction = jsonConvert.convert<String>(json['introduction']);
	if (introduction != null) {
		goodLookDataResponsePageData.introduction = introduction;
	}
	final String? firstEpisodes = jsonConvert.convert<String>(json['firstEpisodes']);
	if (firstEpisodes != null) {
		goodLookDataResponsePageData.firstEpisodes = firstEpisodes;
	}
	final String? sumPlayCnt = jsonConvert.convert<String>(json['sumPlayCnt']);
	if (sumPlayCnt != null) {
		goodLookDataResponsePageData.sumPlayCnt = sumPlayCnt;
	}
	final String? horizontalImage = jsonConvert.convert<String>(json['horizontalImage']);
	if (horizontalImage != null) {
		goodLookDataResponsePageData.horizontalImage = horizontalImage;
	}
	final String? isFinish = jsonConvert.convert<String>(json['isFinish']);
	if (isFinish != null) {
		goodLookDataResponsePageData.isFinish = isFinish;
	}
	final String? previewUrlHttp = jsonConvert.convert<String>(json['previewUrlHttp']);
	if (previewUrlHttp != null) {
		goodLookDataResponsePageData.previewUrlHttp = previewUrlHttp;
	}
	final String? sumPlayCntText = jsonConvert.convert<String>(json['sumPlayCntText']);
	if (sumPlayCntText != null) {
		goodLookDataResponsePageData.sumPlayCntText = sumPlayCntText;
	}
	return goodLookDataResponsePageData;
}

Map<String, dynamic> $GoodLookDataResponsePageDataToJson(GoodLookDataResponsePageData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['videoName'] = entity.videoName;
	data['verticalImage'] = entity.verticalImage;
	data['seriesNum'] = entity.seriesNum;
	data['introduction'] = entity.introduction;
	data['firstEpisodes'] = entity.firstEpisodes;
	data['sumPlayCnt'] = entity.sumPlayCnt;
	data['horizontalImage'] = entity.horizontalImage;
	data['isFinish'] = entity.isFinish;
	data['previewUrlHttp'] = entity.previewUrlHttp;
	data['sumPlayCntText'] = entity.sumPlayCntText;
	return data;
}