import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/good_look_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class GoodLookEntity {
	late int errno;
	late String errmsg;
	late String logid;
	late GoodLookData data;

	GoodLookEntity();

	factory GoodLookEntity.fromJson(Map<String, dynamic> json) => $GoodLookEntityFromJson(json);

	Map<String, dynamic> toJson() => $GoodLookEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GoodLookData {
	late GoodLookDataResponse response;

	GoodLookData();

	factory GoodLookData.fromJson(Map<String, dynamic> json) => $GoodLookDataFromJson(json);

	Map<String, dynamic> toJson() => $GoodLookDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GoodLookDataResponse {
	@JSONField(name: "page_data")
	late List<GoodLookDataResponsePageData> pageData;
	@JSONField(name: "has_more")
	late int hasMore;

	GoodLookDataResponse();

	factory GoodLookDataResponse.fromJson(Map<String, dynamic> json) => $GoodLookDataResponseFromJson(json);

	Map<String, dynamic> toJson() => $GoodLookDataResponseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GoodLookDataResponsePageData {
	late String videoName;
	late String verticalImage;
	late String seriesNum;
	late String introduction;
	late String firstEpisodes;
	late String sumPlayCnt;
	late String horizontalImage;
	late String isFinish;
	late String previewUrlHttp;
	late String sumPlayCntText;

	GoodLookDataResponsePageData();

	factory GoodLookDataResponsePageData.fromJson(Map<String, dynamic> json) => $GoodLookDataResponsePageDataFromJson(json);

	Map<String, dynamic> toJson() => $GoodLookDataResponsePageDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}