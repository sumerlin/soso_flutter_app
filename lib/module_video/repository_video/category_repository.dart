

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app/module_video/model_video/category_filter_entity.dart';

import '../../config/AppNetConfig.dart';
import '../model_video/category_list_entity.dart';

class CategoryRepository{


  static Future<List<CategoryFilterData>> requestCategoryFilterData() async{
    String jsonString = await rootBundle.loadString(AppNetConfig.videoCategoryFilter);
    final json = jsonDecode(jsonString);
    CategoryFilterEntity entity = CategoryFilterEntity.fromJson(json);
    return entity.data;
  }

  static Future<List<CategoryListData>> requestCategoryListData() async{
    String jsonString = await rootBundle.loadString(AppNetConfig.videoCategoryList);
    final json = jsonDecode(jsonString);
    CategoryListEntity entity = CategoryListEntity.fromJson(json);
    return entity.data;
  }



}