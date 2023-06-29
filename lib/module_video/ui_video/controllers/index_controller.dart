

import 'package:get/get.dart';

import '../../model_video/index_response_entity.dart';
import '../../repository_video/index_repository.dart';


class IndexController extends GetxController{
  IndexState _indexState = IndexState();

  IndexState get indexState => _indexState;

  set indexState(value) {
    _indexState = value;
  }
  void loadIndexData()async{
    var indexResponseData = await IndexRepository.requestLocalIndexData();
    var guideList = indexResponseData.top.guide;
    var sections = indexResponseData.sections;
    _indexState.guideList..clear()..addAll(guideList);
    _indexState.sections..clear()..addAll(sections);
    update();
  }

}

class IndexState{
  List<IndexResponseDataTopGuide> guideList = [];
  List<IndexResponseDataSections> sections =[];
}