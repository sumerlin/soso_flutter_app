import 'package:flutter_app/ui/controllers/PagingData.dart';
import 'package:get/get.dart';

import '../../model/HomeModel.dart';
import '../../repository/FavouriteRepository.dart';
import '../../utils/LoggerUtil.dart';
import '../widgets/refresh/page_controller.dart';
import 'FavouriteModel.dart';
import 'FavouritePagingState.dart';

class FavouriteController extends PagingController<Product, FavouritePagingState> {
  final FavouritePagingState _state = FavouritePagingState();

  @override
  FavouritePagingState getState() {
    return _state;
  }

  @override
  Future<PagingData<Product>?> loadData(int pageIndex) async {
    // return getData(pageIndex);
    return loadFavouriteData();
  }

  //模拟数据
  Future<PagingData<Product>?> loadFavouriteData() async {
    // PagingData<Article>? articleList = await apiService.getArticleList(pagingParams);
    // loggerSingle("FavouriteController====getData()");
    // PagingData<FavouriteItemModel> pagingData = PagingData();
    // List<FavouriteItemModel> data = List<FavouriteItemModel>.generate(10, (index) {
    //   var item = FavouriteItemModel();
    //   item.name = "https://pic.616pic.com/photoone/00/00/56/618ce8b3797b76152.jpg";
    //   return item;
    // });
    // pagingData
    //   ..total = 30
    //   ..data = data;
    // return pagingData;

    // var dataList =  FavouriteRepository.favouriteDataApi(0);
    // dataList.then((value) => "");

    PagingData<Product> pagingData = PagingData();
    pagingData.total = 30;
    await FavouriteRepository.favouriteDataApi(0).then((value) => pagingData.data = value);

    return pagingData;
  }
}
