import 'package:flutter_app/network/request_network.dart';

import '../config/AppNetConfig.dart';
import '../model/HomeModel.dart';

class FavouriteRepository {


 static Future<List<Product>?> favouriteDataApi(int pageIndex) async {
    var homeModel = await requestNetwork.get<HomeModel>(AppNetConfig.homeUrl);
    var product = homeModel?.products;
    return product;
  }
}
