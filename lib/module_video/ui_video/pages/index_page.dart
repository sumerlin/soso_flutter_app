import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module_video/ui_video/controllers/index_controller.dart';
import 'package:flutter_app/module_video/ui_video/routers/AppRouter.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:get/get.dart';

import '../../model_video/index_response_entity.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin {
  final IndexController indexController = Get.put(IndexController());

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("_IndexPageState....build()");
    indexController.loadIndexData();
    return Scaffold(
      appBar: AppBar(
        title: Text("好看视频"),
        centerTitle: true,
      ),
      body: GetBuilder<IndexController>(
        builder: (controller) {
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              _buildHorizontalList(),
              ..._allTitleAndGrid(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHorizontalList() {
    var guideList = indexController.indexState.guideList;
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size(200, 180)),
        child: LayoutBuilder(builder: (context, constraints) {
          loggerSingle("constraints...." + constraints.toString());
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemExtent: 120,
            itemCount: guideList.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl: guideList[index].imgUrl),
                  Text(
                    guideList[index].name,
                    maxLines: 1,
                  ),
                  Text(guideList[index].filmSubtitle, maxLines: 1),
                  Text(guideList[index].filmScore.toString()),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  List<Widget> _allTitleAndGrid() {
    var sections = indexController.indexState.sections;
    List<Widget> list = [];
    var titleGridList = sections.map((e) {
      return _buildGrid(e);
    }).toList();
    // for (var item in titleGridList) {
    //   list.addAll(item);
    // }
    for (var value in titleGridList) {
      list.addAll(value);
    }
    return list;
  }

  List<Widget> _buildGrid(IndexResponseDataSections sections) {
    // var sections = indexController.indexState.sections;
    var contents = sections.sectionContents;
    var titleView = SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text(sections.name)),
            Text(sections.moreText),
          ],
        ),
      ),
    );
    var gridView = SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          loggerSingle("IndexPage...SliverGrid...");
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRouterPath.indexInfo, parameters: {
                "dramaId": contents[index].dramaId.toString(),
                "title": contents[index].title
              });
            },
            child: Card(
              margin:EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: contents[index].coverUrl,
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeOutDuration: const Duration(milliseconds: 100),
                    ),
                  ),
                  Text(
                    contents[index].title,
                    maxLines: 1,
                  )
                ],
              ),
            ),
          );
        },
        childCount: contents.length,
      ),
    );

    return [titleView, gridView];
  }
}
