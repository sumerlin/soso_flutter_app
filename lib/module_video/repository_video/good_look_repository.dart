import '../../network/request_network.dart';
import '../model_video/good_look_entity.dart';

class GoodLookRepository {
  static Future<GoodLookData?> requestGoodLookData(int pageNo, int type) {
    //https://haokan.baidu.com/web/video/longpage?rn=20&pn=1&type=0
    return requestNetwork.get<GoodLookData>(
      "https://haokan.baidu.com/web/video/longpage",
      queryParameters: {
        "rn": 20,
        "pn": pageNo,
        "type": type,
      },
    );
  }
}
