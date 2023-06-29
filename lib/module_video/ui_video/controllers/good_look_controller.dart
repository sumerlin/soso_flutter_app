
import 'package:flutter_app/module_video/repository_video/good_look_repository.dart';
import 'package:get/get.dart';

import '../../model_video/good_look_entity.dart';

class GoodLookController extends GetxController {
  GoodLookController(this.type);

  final GoodLookState goodLookState = GoodLookState();
  final int type;


  @override
  void onInit() {
    super.onInit();
    loadGoodLookData(type);
  }

  Future<void> loadGoodLookData(int type) async {
    var goodLookData = await GoodLookRepository.requestGoodLookData(1, type);
    goodLookState.dataResponse = goodLookData!.response;
    goodLookState.isLoading = false;
    update([type.toString()]);
    return Future.value();
  }
}

class GoodLookState {
  bool isLoading = true;
  var dataResponse = GoodLookDataResponse();
}
