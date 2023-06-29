import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module_video/ui_video/controllers/good_look_controller.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:get/get.dart';

import '../../model_video/good_look_tab_entity.dart';

class GoodLookPage extends StatefulWidget {
  const GoodLookPage({super.key});

  @override
  State<GoodLookPage> createState() => _GoodLookPageState();
}

class _GoodLookPageState extends State<GoodLookPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: DramaType.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("_GoodLookPageState....build()");
    return Scaffold(
      appBar: AppBar(
        title: _buildTabBar(),
      ),
      body: _buildTabBarView(),
    );
  }

  TabBar _buildTabBar() {
    List<Tab> tabList = DramaType.values.map((e) => Tab(text: e.name)).toList();
    return TabBar(
      controller: tabController,
      enableFeedback: false,
      isScrollable: true,
      //设置可以滚动，title就会显示全
      splashFactory: NoSplash.splashFactory,
      // labelStyle: const TextStyle(
      //   fontSize: 15,
      //   fontWeight: FontWeight.bold,
      // ),
      tabs: tabList,
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      children: DramaType.values.map((e) => GoodLookTabPage(e.value)).toList(),
    );
  }
}

class GoodLookTabPage extends StatefulWidget {
  GoodLookTabPage(
    this.type, {
    super.key,
  });

  final int type;

  @override
  State<GoodLookTabPage> createState() => _GoodLookTabPageState();
}

class _GoodLookTabPageState extends State<GoodLookTabPage> with AutomaticKeepAliveClientMixin {
  // late var controller;
  late var controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        Get.put<GoodLookController>(GoodLookController(widget.type), tag: widget.type.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("GoodLookTabPage...build()...type:" + widget.type.toString());

    return GetBuilder<GoodLookController>(
        init: controller,
        tag: widget.type.toString(),
        id: widget.type.toString(),
        builder: (controller) {
          var goodLookState = controller.goodLookState;
          if (goodLookState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          var dataResponse = goodLookState.dataResponse;
          var pageData = dataResponse.pageData;
          loggerSingle("GoodLookTabPage...GridView...build()...type:" + widget.type.toString());
          loggerSingle("GoodLookTabPage...controller:" + controller.hashCode.toString());
          return RefreshIndicator(
            onRefresh: () async {
              var wait = await controller.loadGoodLookData(widget.type);
              return wait;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.65,
              ),
              itemCount: pageData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRouterPath.indexInfo, parameters: {
                    //   "dramaId": contents[index].dramaId.toString(),
                    //   "title": contents[index].title
                    // });
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: pageData[index].verticalImage,
                          fadeInDuration: const Duration(milliseconds: 100),
                          fadeOutDuration: const Duration(milliseconds: 100),
                        ),
                      ),
                      Text(
                        pageData[index].videoName,
                        maxLines: 1,
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
