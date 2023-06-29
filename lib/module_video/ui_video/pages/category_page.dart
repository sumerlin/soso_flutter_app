import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module_video/ui_video/controllers/category_controller.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:get/get.dart';

import '../../model_video/category_filter_entity.dart';
import '../routers/AppRouter.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  final _filterController = Get.put<CategoryController>(CategoryController());
  int filterLength = 5;

  @override
  bool get wantKeepAlive => true;
  ValueNotifier<bool> showTitleNotify = ValueNotifier(false);
  late ScrollController _scrollController;

  @override
  void dispose() {
    showTitleNotify.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (mounted) {
        double extent = _scrollController.offset;
        double height = filterLength * 44 - 32;
        if (extent >= height) {
          if (showTitleNotify.value == false) {
            showTitleNotify.value = true;
          }
        } else {
          if (showTitleNotify.value) {
            showTitleNotify.value = false;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("_CategoryPageState....build()");
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xfff3f6f8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.search,
                size: 12,
                color: Color(0xffadb6c2),
              ),
              Text(
                '搜索你想找的剧集',
                style: TextStyle(fontSize: 12, color: Color(0xffadb6c2)),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _buildHeaderView(),
          _buildGridView(),
        ],
      ),
    );
  }

  // List<List<String>> headerList = [headers01,headers02,headers03];
  Widget _buildHeaderView() {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: 32,
      toolbarHeight: 32,
      expandedHeight: 5 * 44 + 10,
      shadowColor: Colors.black.withAlpha(25),
      title: ValueListenableBuilder<bool>(
        valueListenable: showTitleNotify,
        builder: (context, value, child) {
          loggerSingle("SliverAppBar...ValueListenableBuilder...");
          return Offstage(
            offstage: !value,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "过滤条件",
                style: TextStyle(
                  color: Color(0xfffb6060),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: GetBuilder<CategoryController>(
            init: _filterController,
            id: _filterController.filterState.id,
            builder: (context) {
              if (_filterController.filterState.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var filterDataList = _filterController.filterState.filterData;
              return SizedBox(
                height: filterDataList.length * 44,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: filterDataList
                      .map((filterData) => HeaderItemView(filterData: filterData))
                      .toList(),
                ),
              );
            }), //背景组件
      ),
    );
  }

  Widget _buildGridView() {
    return SliverLayoutBuilder(
      builder: (BuildContext context,  constraints) {
        return GetBuilder<CategoryController>(
            init: _filterController,
            id: _filterController.listState.id,
            builder: (context) {
              if (_filterController.listState.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var listData = _filterController.listState.listData;
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150.0,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.65,
                ),
                // itemCount: 20,
                // shrinkWrap: true,
                delegate: SliverChildBuilderDelegate(
                  childCount: listData.length,
                  (context, index) {
                    return GestureDetector(
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: listData[index].coverUrl,
                                fadeInDuration: const Duration(milliseconds: 100),
                                fadeOutDuration: const Duration(milliseconds: 100),
                              ),
                            ),
                            Text(
                              listData[index].title,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(AppRouterPath.indexInfo, parameters: {
                          "dramaId": listData[index].dramaId.toString(),
                          "title": listData[index].title
                        });
                      },
                    );
                  },
                )
              );
            });
      }
    );
  }
}

// return GridView.builder(
// gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 150.0,
// mainAxisSpacing: 2,
// crossAxisSpacing: 2,
// childAspectRatio: 0.65,
// ),
// itemCount: 20,
// // shrinkWrap: true,
// itemBuilder: (BuildContext context, int index) {
// return Column(
// children: [
// Expanded(
// child: CachedNetworkImage(
// imageUrl: listData[index].coverUrl,
// fadeInDuration: const Duration(milliseconds: 100),
// fadeOutDuration: const Duration(milliseconds: 100),
// ),
// ),
// Text(
// listData[index].title,
// maxLines: 1,
// )
// ],
// );
// },
// );




class HeaderItemView extends StatefulWidget {
  const HeaderItemView({required this.filterData, super.key});

  final CategoryFilterData filterData;

  @override
  State<HeaderItemView> createState() => _HeaderItemViewState();
}

class _HeaderItemViewState extends State<HeaderItemView> with SingleTickerProviderStateMixin {
  late var _tabController;
  late List<Widget> _tabs;
  late var _filterData;
  late List<CategoryFilterDataDramaFilterItemList> _dramaFilterItemList;

  @override
  void initState() {
    super.initState();
    _filterData = widget.filterData;
    _dramaFilterItemList = widget.filterData.dramaFilterItemList;
    _tabController = TabController(length: _dramaFilterItemList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabs = _dramaFilterItemList
        .map((filterItem) => Tab(
              height: 32,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xfff3f6f8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  filterItem.displayName,
                  style: const TextStyle(
                      // color: Color(0xfffb6060),
                      // fontSize: 14,
                      // fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ))
        .toList();
    // Theme(
    //     data: Theme.of(context)
    //         .copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, //点击时水波纹背景为透明
          highlightColor: Colors.transparent, //点击是背景高亮颜色设置为透明
          shadowColor: Colors.transparent,
        ),
        //     ThemeData(
        //   splashColor: Colors.transparent, //点击时水波纹背景为透明
        //   highlightColor: Colors.transparent, //点击是背景高亮颜色设置为透明
        // ),
        child: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelColor: Color(0xff868996),
          // unselectedLabelColor:Color(0xffcbcdd4),
          indicatorWeight: 0.00001,
          enableFeedback: false,
          dividerColor: Colors.transparent,

          padding: EdgeInsets.symmetric(horizontal: 6),
        ),
      ),
    );
  }
}
