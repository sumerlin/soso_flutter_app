import 'package:flutter_app/module_video/repository_video/category_repository.dart';
import 'package:get/get.dart';

import '../../model_video/category_filter_entity.dart';
import '../../model_video/category_list_entity.dart';

class CategoryController extends GetxController {
  CategoryFilterState filterState = CategoryFilterState();
  CategoryListState listState = CategoryListState();

  @override
  void onInit() {
    super.onInit();
    loadCategoryFilterData();
    loadCategoryListData();
  }

  void loadCategoryFilterData() async {
    List<CategoryFilterData> filterData = await CategoryRepository.requestCategoryFilterData();
    filterState.filterData = filterData;
    filterState.isLoading = false;
    update([filterState.id]);
  }

  void loadCategoryListData() async {
    List<CategoryListData> listData = await CategoryRepository.requestCategoryListData();
    listState.listData = listData;
    listState.isLoading = false;
    update([listState.id]);
  }
}

class CategoryFilterState {
  late int id;
  bool isLoading = true;

  CategoryFilterState() {
    id = runtimeType.hashCode;
  }

  late List<CategoryFilterData> filterData;
}

class CategoryListState {
  late int id;
  bool isLoading = true;

  CategoryListState() {
    id = runtimeType.hashCode;
  }

  late List<CategoryListData> listData;
}
