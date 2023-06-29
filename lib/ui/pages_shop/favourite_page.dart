import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/HomeModel.dart';
import '../controllers/FavouriteController.dart';
import '../controllers/FavouriteModel.dart';
import '../widgets/refresh/page_controller.dart';
import '../widgets/refresh/page_state.dart';

class FavouritePage extends StatelessWidget {
  // const FavouritePage({super.key});
  FavouritePage({super.key}) {
    loggerSingle("FavouritePage...init");
    Get.put(FavouriteController());
  }

  // FavouritePage({key}) : super(key: key) {
  //   Get.put(FavouriteController());
  // }

  // final FavouriteController _controller = FavouriteController();

  @override
  Widget build(BuildContext context) {
    // Get.put(FavouriteController());
    return buildRefreshListWidget<Product, FavouriteController>(
        itemBuilder: (Product item, int index) {
          return _buildItem(item);
        });
  }
}

Widget _buildItem(Product item) {
  return Card(
    margin: EdgeInsets.all(10),
    elevation: 5,
    // child: Text("123313"),
    child: SizedBox(
      height: 100,
      child: CachedNetworkImage(
        imageUrl: item.image,
        // imageUrl: "",
        fit: BoxFit.contain,
      ),
    ),

    // child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Expanded(
    //       child: Container(
    //         decoration: const BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(10),
    //             topRight: Radius.circular(10),
    //           ),
    //           color: Colors.white,
    //         ),
    //         child: CachedNetworkImage(
    //           imageUrl: item.name ?? "",
    //           // imageUrl: "",
    //           fit: BoxFit.contain,
    //         ),
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         IconButton(
    //             onPressed: () => "",
    //             icon: true
    //                 ? const Icon(
    //                     Icons.favorite,
    //                     color: Colors.red,
    //                     size: 18,
    //                   )
    //                 : const Icon(
    //                     Icons.favorite_border,
    //                     color: Colors.red,
    //                     size: 18,
    //                   )),
    //         Expanded(
    //           flex: 3,
    //           child: SizedBox(
    //               height: 55,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     item.name ?? "",
    //                     overflow: TextOverflow.ellipsis,
    //                     textAlign: TextAlign.start,
    //                     style: const TextStyle(
    //                       fontSize: 13,
    //                       fontWeight: FontWeight.bold,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                     maxLines: 1,
    //                   ),
    //                   Text(
    //                     item.name ?? "",
    //                     overflow: TextOverflow.ellipsis,
    //                     textAlign: TextAlign.start,
    //                     maxLines: 1,
    //                   ),
    //                 ],
    //               )),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  );
  ;
}

Widget buildRefreshListWidget<T, C extends PagingController<T, PagingState<T>>>(
    {required Widget Function(T item, int index) itemBuilder,
      bool enablePullUp = true,
      bool enablePullDown = true,
      String? tag,
      Widget Function(T item, int index)? separatorBuilder,
      Function(T item, int index)? onItemClick,
      ScrollPhysics? physics,
      bool shrinkWrap = false,
      Axis scrollDirection = Axis.vertical}) {
  C controller = Get.find(tag: tag);
  return GetBuilder<C>(
    builder: (controller) {
      return buildRefreshWidget(
        builder: () =>
            buildListView<T>(
                data: controller.pagingState.data,
                separatorBuilder: separatorBuilder,
                itemBuilder: itemBuilder,
                onItemClick: onItemClick,
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection),
        refreshController: controller.refreshController,
        onRefresh: controller.refreshData,
        onLoad: controller.loadMoreData,
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp && controller.pagingState.hasMore,
      );
    },
    tag: tag,
    id: controller.pagingState.refreshId,
  );
}

Widget buildListView<T>({required Widget Function(T item, int index) itemBuilder,
  required List<T> data,
  Widget Function(T item, int index)? separatorBuilder,
  Function(T item, int index)? onItemClick,
  ScrollPhysics? physics,
  bool shrinkWrap = false,
  Axis scrollDirection = Axis.vertical}) {
  return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.zero,
      scrollDirection: scrollDirection,
      itemBuilder: (ctx, index) =>
          GestureDetector(
            child: itemBuilder.call(data[index], index),
            onTap: () => onItemClick?.call(data[index], index),
          ),
      separatorBuilder: (ctx, index) => separatorBuilder?.call(data[index], index) ?? Container(),
      itemCount: data.length);
}

Widget buildRefreshWidget({required Widget Function() builder,
  VoidCallback? onRefresh,
  VoidCallback? onLoad,
  required RefreshController refreshController,
  bool enablePullUp = true,
  bool enablePullDown = true}) {
  return SmartRefresher(
    enablePullUp: enablePullUp,
    enablePullDown: enablePullDown,
    controller: refreshController,
    onRefresh: onRefresh,
    onLoading: onLoad,
    header: const ClassicHeader(
      idleText: "下拉刷新",
      releaseText: "松开刷新",
      completeText: "刷新完成",
      refreshingText: "加载中......",
    ),
    footer: const ClassicFooter(
      idleText: "上拉加载更多",
      canLoadingText: "松开加载更多",
      loadingText: "加载中......",
    ),
    child: builder(),
  );
}
