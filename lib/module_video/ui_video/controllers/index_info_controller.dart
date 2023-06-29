import 'package:flutter_app/module_video/repository_video/index_repository.dart';
import 'package:get/get.dart';

import '../../model_video/index_info_entity.dart';

class IndexInfoController extends GetxController {
  IndexInfoState indexInfoState = IndexInfoState();
  @override
  void onInit() {
    super.onInit();
    indexInfoState.dramaId = Get.parameters["dramaId"]!;
    indexInfoState.title = Get.parameters["title"]!;
    // loadInfoData();
  }

  Future<IndexInfoState> loadInfoData() async{
    var indexInfoData =  await IndexRepository.requestLocalIndexInfoData();
    indexInfoState.indexInfoData = indexInfoData;
    update();
    return  indexInfoState;
  }

}

class IndexInfoState{
  String dramaId ="";
  String title="";
  late IndexInfoData indexInfoData;
}