

import 'package:get/get.dart';

import '../pages/video_info_page.dart';
import '../pages/main_page.dart';

class AppRouterPath {
  static String main = "/";
  static String indexInfo = "/index/info";
}

class AppRouter {
  static pageList() => [
    GetPage(
      name: AppRouterPath.main,
      page: () =>  MainPage(),
      // binding: FavouritePageBinding(),
    ),
    GetPage(
      name: AppRouterPath.indexInfo,
      page: () =>   VideoInfoPage(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
