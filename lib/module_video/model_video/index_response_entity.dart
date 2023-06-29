import 'package:flutter_app/generated/json/base/json_field.dart';
import 'package:flutter_app/generated/json/index_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class IndexResponseEntity {
	late String requestId;
	late String code;
	late String msg;
	dynamic recordsTotal;
	late IndexResponseData data;

	IndexResponseEntity();

	factory IndexResponseEntity.fromJson(Map<String, dynamic> json) => $IndexResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseData {
	late IndexResponseDataTop top;
	late bool isEnd;
	late List<IndexResponseDataSections> sections;

	IndexResponseData();

	factory IndexResponseData.fromJson(Map<String, dynamic> json) => $IndexResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseDataTop {
	late List<IndexResponseDataTopEye> eye;
	late List<IndexResponseDataTopGuide> guide;

	IndexResponseDataTop();

	factory IndexResponseDataTop.fromJson(Map<String, dynamic> json) => $IndexResponseDataTopFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataTopToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseDataTopEye {
	late int id;
	late String name;
	late String title;
	late String imgUrl;
	late String targetUrl;
	late String type;
	late int sequence;
	late String redirectUrl;
	late String position;
	late String filmSubtitle;
	late String filmTitle;
	late double filmScore;

	IndexResponseDataTopEye();

	factory IndexResponseDataTopEye.fromJson(Map<String, dynamic> json) => $IndexResponseDataTopEyeFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataTopEyeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseDataTopGuide {
	late int id;
	late String name;
	late String title;
	late String imgUrl;
	late String targetUrl;
	late String type;
	late int sequence;
	late String redirectUrl;
	late String position;
	late String filmSubtitle;
	late String filmTitle;
	late double filmScore;

	IndexResponseDataTopGuide();

	factory IndexResponseDataTopGuide.fromJson(Map<String, dynamic> json) => $IndexResponseDataTopGuideFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataTopGuideToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseDataSections {
	late int id;
	late String display;
	late String moreText;
	late String name;
	late int position;
	late String sectionType;
	late int sequence;
	late String targetId;
	dynamic targetType;
	late String displayTitle;
	late List<IndexResponseDataSectionsSectionContents> sectionContents;
	dynamic startTime;
	dynamic endTime;

	IndexResponseDataSections();

	factory IndexResponseDataSections.fromJson(Map<String, dynamic> json) => $IndexResponseDataSectionsFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataSectionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class IndexResponseDataSectionsSectionContents {
	late int dramaId;
	late String title;
	late String subTitle;
	late String coverUrl;
	late String dramaType;
	late double score;
	dynamic feeMode;
	dynamic favorite;
	dynamic count;
	late bool vipFlag;

	IndexResponseDataSectionsSectionContents();

	factory IndexResponseDataSectionsSectionContents.fromJson(Map<String, dynamic> json) => $IndexResponseDataSectionsSectionContentsFromJson(json);

	Map<String, dynamic> toJson() => $IndexResponseDataSectionsSectionContentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}