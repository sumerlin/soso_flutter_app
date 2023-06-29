

import 'package:flutter_app/ui/controllers/FavouriteController.dart';
import 'package:get/get.dart';

class FavouritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteController());
  }
}
