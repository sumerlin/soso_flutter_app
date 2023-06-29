import 'package:flutter/material.dart';
import 'package:flutter_app/module_video/ui_video/controllers/index_info_controller.dart';
import 'package:flutter_app/module_video/ui_video/widgets/video_player_view.dart';
import 'package:get/get.dart';

import '../../../config/ResourceRef.dart';

//视频详细页面，包括播放
class VideoInfoPage extends StatelessWidget {
  VideoInfoPage({super.key});

  final controller = Get.put<IndexInfoController>(IndexInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.indexInfoState.title),
          // title: Text(""),
        ),
        body: FutureBuilder(
          future: controller.loadInfoData(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return GetBuilder(
                  init: controller,
                  builder: (controller) {
                    return SingleChildScrollView(
                      child: _buildInfoDetail(context),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget _buildInfoDetail(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    var height = 9 / 16 * screenWidth;

    var drama = controller.indexInfoState.indexInfoData.drama;
    var playInfo = controller.indexInfoState.indexInfoData.playInfo;
    var episodeList = controller.indexInfoState.indexInfoData.episodeList;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoPlayerView(
            url: playInfo.url,
          ),
          Text(
            drama.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff3b4051),
            ),
          ),
          Text(drama.enName),
          Text(
            "${drama.dramaType}/${drama.year}/${drama.area}/${drama.cat}",
          ),
          Text(
            drama.brief,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff868996),
              height: 1.5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                drama.score.toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffb6060),
                ),
              )),
              TextButton(onPressed: null, child: Text("下载")),
              TextButton(onPressed: null, child: Text("分享")),
              TextButton(onPressed: null, child: Text("举报")),
            ],
          ),
          const Text("选集",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff32383a),
              )),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: episodeList.length,
            itemBuilder: (context, index) {
              return Container(
                child: index == 0
                    ? Image.asset(R.Img.ic_playing)
                    : Text(episodeList[index].episodeNo.toString()),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minWidth: 54,
                  minHeight: 54,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfff3f6f8),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
