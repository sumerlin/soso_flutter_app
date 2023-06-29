import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network_test/dio_manager.dart';
import '../network_test/service_url.dart';


class DioPage extends StatelessWidget {
  const DioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DioPage"),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            doGet();
          },
          child: Text("doGet"),
        ),
        ElevatedButton(
          onPressed: () {
            doPost();
          },
          child: Text("doPost"),
        ),
      ],
    );
  }

  void doGet() async {
    var option = BaseOptions(connectTimeout: Duration(seconds: 3));

    Dio dio = Dio(option);
    dio.interceptors.add(LogInterceptor());
    await dio.get<String>('http://jsonplaceholder.typicode.com/posts').then((value) {
      print("value::" + value.data.toString());
      print("value");
    });
    // print("value::" + value.toString()
    print("value");
  }
}

void doPost() {
  // const String baseUrl = 'http://175.27.193.33:8080/hrlweibo/';
  // var options = BaseOptions(
  //   baseUrl: baseUrl,
  //   connectTimeout: Duration(milliseconds: 5000),
  //   receiveTimeout: Duration(milliseconds: 3000),
  // );
  // late Dio dio = Dio(options);
  List<String> mBannerAdList = [];
  FormData params = FormData.fromMap({'pageNum': "1", 'pageSize': "30"});
  DioManager.instance.post(ServiceUrl.getVideoHotBannerAdList, params, (data) {
    List<String> list = [];
    data.forEach((data) {
      list.add(data.toString());
    });
    mBannerAdList = [];
    mBannerAdList = list;
    // setState(() {});
  }, (error) {});
  getListData(1);
  getVideoHotList(1);
  getVideoRecommendList(1);

}
void getListData(pageNum) async {

  /* await Future.delayed(Duration(seconds: 3));
    if (pageNum == 3) {
      print("网路:" + pageNum);
    }
*/
  FormData params =
  FormData.fromMap({'pageNum': pageNum.toString(), 'pageSize': "30"});
  Map<String, dynamic> json = await DioManager.instance
      .post(ServiceUrl.getVideoSmallList, params);
  // List<VideoModel> list = [];
  // json['list'].forEach((data) {
  //   list.add(VideoModel.fromJson(data));
  // });

  // return list;
}


void getVideoHotList(pageNum) async {
  await Future.delayed(Duration(seconds: 3));

  FormData params =   FormData.fromMap({'pageNum': pageNum.toString(), 'pageSize': "30"});
  Map<String, dynamic> json = await DioManager.instance
      .post (ServiceUrl.getVideoHotList, params);
  // List<VideoModel> list = [];
  json ['list'].forEach((data) {
    // list.add(VideoModel.fromJson(data));
  });

  // return list;
}
// Future getmRecommendVideoList() async {
//   FormData params = FormData.fromMap({
//     'videoid': widget.mVideo.id,
//   });
//   DioManager.instance
//       .post(ServiceUrl.getVideoDetailRecommendList, params, (data) {
//     mRecommendVideoList.clear();
//     data.forEach((data) {
//       mRecommendVideoList.add(VideoModel.fromJson(data));
//     });
//
//     setState(() {});
//   }, (error) {});
// }

void getVideoRecommendList(pageNum) async {
  /* await Future.delayed(Duration(seconds: 3));
    if (pageNum == 3) {
      print("网路:" + pageNum);
    }
*/
  FormData params =
  FormData.fromMap({'pageNum': pageNum.toString(), 'pageSize': "10"});
  Map<String, dynamic> json = await DioManager.instance
      .post(ServiceUrl.getVideoRecommendList, params);
  // List<VideoModel> list = [];
  json['list'].forEach((data) {
    // list.add(VideoModel.fromJson(data));
  });

  // return list;
}