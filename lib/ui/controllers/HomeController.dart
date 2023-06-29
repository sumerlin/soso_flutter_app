import 'package:flutter_app/model/category_entity.dart';
import 'package:get/get.dart';

import '../../model/HomeModel.dart';
import '../../model/category_data_model.dart' as CategoryPackage;
// import '../../model/home_data_model.dart' as old;
import '../../repository/HomeRepository.dart';

class HomeController extends GetxController {
  final _homeRepository = HomeRepository();

  // late var data = Rxn<Data>();
  // late var banners = Rxn<List<Banner>>();

  final data = Rxn<HomeModel>();
  final banners = Rxn<List<Banner>>();
  final productList = Rxn<List<Product>>();

  //分类小图 List<Datum>
  final categoryEntity = Rxn<CategoryEntity>();
  final datumList = Rxn<List<CategoryData>>();

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadHomeData() async {
    _homeRepository.homeDataApi().then((model) {
      data.value = model;
      banners.value = model?.banners;
      productList.value = model?.products;
    }).then((value) {
      //分类小图
      _homeRepository.categoryDataApi().then((model) {
        categoryEntity.value = model;
        datumList.value = model?.data;
        update();

      });
    });
  }

}
