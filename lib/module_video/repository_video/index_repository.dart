import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app/config/AppNetConfig.dart';

import '../model_video/index_info_entity.dart';
import '../model_video/index_response_entity.dart';

class IndexRepository {
  static Future<IndexResponseData> requestLocalIndexData() async {
    String jsonString = await rootBundle.loadString(AppNetConfig.videoIndex);
    final json = jsonDecode(jsonString);
    IndexResponseEntity entity = IndexResponseEntity.fromJson(json);
    await Future.delayed(const Duration(seconds: 1),() => null,);
    return entity.data;
  }



  static Future<IndexInfoData> requestLocalIndexInfoData() async{

    String jsonString = await rootBundle.loadString(AppNetConfig.videoIndexInfo);
    final json = jsonDecode(jsonString);
    IndexInfoEntity entity = IndexInfoEntity.fromJson(json);

    var data = await Future.delayed(const Duration(seconds: 0),() =>  entity.data,);
    return data;

  }
}
