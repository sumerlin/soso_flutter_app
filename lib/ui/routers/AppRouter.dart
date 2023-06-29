// 页面路由 映射关联
import 'package:get/get.dart';

import '../../test_mvvm/mvvm_home_page.dart';
import '../controllers/FavouritePageBinding.dart';
import '../pages_shop/index_page.dart';

class AppRouterPath {
  static String index = "/";
  static String indexHome = "/index/home";
}

class AppRouter {
  static pageList() => [
        GetPage(
          name: AppRouterPath.index,
          page: () => IndexPage(),
          // binding: FavouritePageBinding(),
        ),
        GetPage(
          name: AppRouterPath.indexHome,
          page: () => const MvvmHomePage(),
          transition: Transition.rightToLeftWithFade,
        ),
      ];
}
