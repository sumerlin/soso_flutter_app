import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/index_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class IndexInfoEntity {
	late String requestId;
	late String code;
	late String msg;
	late IndexInfoData data;

	IndexInfoEntity();

	factory IndexInfoEntity.fromJson(Map<String, dynamic> json) => $IndexInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexInfoData {
	dynamic seriesList;
	late IndexInfoDataDrama drama;
	late List<IndexInfoDataEpisodeList> episodeList;
	late IndexInfoDataPlayInfo playInfo;
	late List<IndexInfoDataQualityList> qualityList;

	IndexInfoData();

	factory IndexInfoData.fromJson(Map<String, dynamic> json) => $IndexInfoDataFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexInfoDataDrama {
	late int id;
	late String createTime;
	late String title;
	late String cover;
	late double score;
	late String year;
	late String area;
	late String enName;
	late String cat;
	late String dramaType;
	late String serializedStatus;
	late String brief;
	late int episodeCount;

	IndexInfoDataDrama();

	factory IndexInfoDataDrama.fromJson(Map<String, dynamic> json) => $IndexInfoDataDramaFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoDataDramaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexInfoDataEpisodeList {
	late int episodeNo;
	late String text;
	late int episodeSid;

	IndexInfoDataEpisodeList();

	factory IndexInfoDataEpisodeList.fromJson(Map<String, dynamic> json) => $IndexInfoDataEpisodeListFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoDataEpisodeListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexInfoDataPlayInfo {
	late String url;
	late String currentQuality;
	late int mediaId;
	late int episodeSid;
	late int startingLength;

	IndexInfoDataPlayInfo();

	factory IndexInfoDataPlayInfo.fromJson(Map<String, dynamic> json) => $IndexInfoDataPlayInfoFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoDataPlayInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexInfoDataQualityList {
	late String quality;
	late String qualityName;

	IndexInfoDataQualityList();

	factory IndexInfoDataQualityList.fromJson(Map<String, dynamic> json) => $IndexInfoDataQualityListFromJson(json);

	Map<String, dynamic> toJson() => $IndexInfoDataQualityListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}