import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/module_video/model_video/index_info_entity.dart';

IndexInfoEntity $IndexInfoEntityFromJson(Map<String, dynamic> json) {
	final IndexInfoEntity indexInfoEntity = IndexInfoEntity();
	final String? requestId = jsonConvert.convert<String>(json['requestId']);
	if (requestId != null) {
		indexInfoEntity.requestId = requestId;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		indexInfoEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		indexInfoEntity.msg = msg;
	}
	final IndexInfoData? data = jsonConvert.convert<IndexInfoData>(json['data']);
	if (data != null) {
		indexInfoEntity.data = data;
	}
	return indexInfoEntity;
}

Map<String, dynamic> $IndexInfoEntityToJson(IndexInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['requestId'] = entity.requestId;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data.toJson();
	return data;
}

IndexInfoData $IndexInfoDataFromJson(Map<String, dynamic> json) {
	final IndexInfoData indexInfoData = IndexInfoData();
	final dynamic seriesList = jsonConvert.convert<dynamic>(json['seriesList']);
	if (seriesList != null) {
		indexInfoData.seriesList = seriesList;
	}
	final IndexInfoDataDrama? drama = jsonConvert.convert<IndexInfoDataDrama>(json['drama']);
	if (drama != null) {
		indexInfoData.drama = drama;
	}
	final List<IndexInfoDataEpisodeList>? episodeList = jsonConvert.convertListNotNull<IndexInfoDataEpisodeList>(json['episodeList']);
	if (episodeList != null) {
		indexInfoData.episodeList = episodeList;
	}
	final IndexInfoDataPlayInfo? playInfo = jsonConvert.convert<IndexInfoDataPlayInfo>(json['playInfo']);
	if (playInfo != null) {
		indexInfoData.playInfo = playInfo;
	}
	final List<IndexInfoDataQualityList>? qualityList = jsonConvert.convertListNotNull<IndexInfoDataQualityList>(json['qualityList']);
	if (qualityList != null) {
		indexInfoData.qualityList = qualityList;
	}
	return indexInfoData;
}

Map<String, dynamic> $IndexInfoDataToJson(IndexInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['seriesList'] = entity.seriesList;
	data['drama'] = entity.drama.toJson();
	data['episodeList'] =  entity.episodeList.map((v) => v.toJson()).toList();
	data['playInfo'] = entity.playInfo.toJson();
	data['qualityList'] =  entity.qualityList.map((v) => v.toJson()).toList();
	return data;
}

IndexInfoDataDrama $IndexInfoDataDramaFromJson(Map<String, dynamic> json) {
	final IndexInfoDataDrama indexInfoDataDrama = IndexInfoDataDrama();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		indexInfoDataDrama.id = id;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		indexInfoDataDrama.createTime = createTime;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		indexInfoDataDrama.title = title;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		indexInfoDataDrama.cover = cover;
	}
	final double? score = jsonConvert.convert<double>(json['score']);
	if (score != null) {
		indexInfoDataDrama.score = score;
	}
	final String? year = jsonConvert.convert<String>(json['year']);
	if (year != null) {
		indexInfoDataDrama.year = year;
	}
	final String? area = jsonConvert.convert<String>(json['area']);
	if (area != null) {
		indexInfoDataDrama.area = area;
	}
	final String? enName = jsonConvert.convert<String>(json['enName']);
	if (enName != null) {
		indexInfoDataDrama.enName = enName;
	}
	final String? cat = jsonConvert.convert<String>(json['cat']);
	if (cat != null) {
		indexInfoDataDrama.cat = cat;
	}
	final String? dramaType = jsonConvert.convert<String>(json['dramaType']);
	if (dramaType != null) {
		indexInfoDataDrama.dramaType = dramaType;
	}
	final String? serializedStatus = jsonConvert.convert<String>(json['serializedStatus']);
	if (serializedStatus != null) {
		indexInfoDataDrama.serializedStatus = serializedStatus;
	}
	final String? brief = jsonConvert.convert<String>(json['brief']);
	if (brief != null) {
		indexInfoDataDrama.brief = brief;
	}
	final int? episodeCount = jsonConvert.convert<int>(json['episodeCount']);
	if (episodeCount != null) {
		indexInfoDataDrama.episodeCount = episodeCount;
	}
	return indexInfoDataDrama;
}

Map<String, dynamic> $IndexInfoDataDramaToJson(IndexInfoDataDrama entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['createTime'] = entity.createTime;
	data['title'] = entity.title;
	data['cover'] = entity.cover;
	data['score'] = entity.score;
	data['year'] = entity.year;
	data['area'] = entity.area;
	data['enName'] = entity.enName;
	data['cat'] = entity.cat;
	data['dramaType'] = entity.dramaType;
	data['serializedStatus'] = entity.serializedStatus;
	data['brief'] = entity.brief;
	data['episodeCount'] = entity.episodeCount;
	return data;
}

IndexInfoDataEpisodeList $IndexInfoDataEpisodeListFromJson(Map<String, dynamic> json) {
	final IndexInfoDataEpisodeList indexInfoDataEpisodeList = IndexInfoDataEpisodeList();
	final int? episodeNo = jsonConvert.convert<int>(json['episodeNo']);
	if (episodeNo != null) {
		indexInfoDataEpisodeList.episodeNo = episodeNo;
	}
	final String? text = jsonConvert.convert<String>(json['text']);
	if (text != null) {
		indexInfoDataEpisodeList.text = text;
	}
	final int? episodeSid = jsonConvert.convert<int>(json['episodeSid']);
	if (episodeSid != null) {
		indexInfoDataEpisodeList.episodeSid = episodeSid;
	}
	return indexInfoDataEpisodeList;
}

Map<String, dynamic> $IndexInfoDataEpisodeListToJson(IndexInfoDataEpisodeList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['episodeNo'] = entity.episodeNo;
	data['text'] = entity.text;
	data['episodeSid'] = entity.episodeSid;
	return data;
}

IndexInfoDataPlayInfo $IndexInfoDataPlayInfoFromJson(Map<String, dynamic> json) {
	final IndexInfoDataPlayInfo indexInfoDataPlayInfo = IndexInfoDataPlayInfo();
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		indexInfoDataPlayInfo.url = url;
	}
	final String? currentQuality = jsonConvert.convert<String>(json['currentQuality']);
	if (currentQuality != null) {
		indexInfoDataPlayInfo.currentQuality = currentQuality;
	}
	final int? mediaId = jsonConvert.convert<int>(json['mediaId']);
	if (mediaId != null) {
		indexInfoDataPlayInfo.mediaId = mediaId;
	}
	final int? episodeSid = jsonConvert.convert<int>(json['episodeSid']);
	if (episodeSid != null) {
		indexInfoDataPlayInfo.episodeSid = episodeSid;
	}
	final int? startingLength = jsonConvert.convert<int>(json['startingLength']);
	if (startingLength != null) {
		indexInfoDataPlayInfo.startingLength = startingLength;
	}
	return indexInfoDataPlayInfo;
}

Map<String, dynamic> $IndexInfoDataPlayInfoToJson(IndexInfoDataPlayInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['url'] = entity.url;
	data['currentQuality'] = entity.currentQuality;
	data['mediaId'] = entity.mediaId;
	data['episodeSid'] = entity.episodeSid;
	data['startingLength'] = entity.startingLength;
	return data;
}

IndexInfoDataQualityList $IndexInfoDataQualityListFromJson(Map<String, dynamic> json) {
	final IndexInfoDataQualityList indexInfoDataQualityList = IndexInfoDataQualityList();
	final String? quality = jsonConvert.convert<String>(json['quality']);
	if (quality != null) {
		indexInfoDataQualityList.quality = quality;
	}
	final String? qualityName = jsonConvert.convert<String>(json['qualityName']);
	if (qualityName != null) {
		indexInfoDataQualityList.qualityName = qualityName;
	}
	return indexInfoDataQualityList;
}

Map<String, dynamic> $IndexInfoDataQualityListToJson(IndexInfoDataQualityList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['quality'] = entity.quality;
	data['qualityName'] = entity.qualityName;
	return data;
}