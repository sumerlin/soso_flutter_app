import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/network/request.dart';
import 'package:flutter_app/ui/controllers/HomeController.dart';
import 'package:get/get.dart';

import '../../config/AppColorConfig.dart';
import '../../test/test_dio_fz.dart';
import '../../utils/LoggerUtil.dart';
import '../../utils/screen_size_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      // tag: "HomeController",
      builder: (HomeController controller) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            //轮播图
            HomeBanner(),
            // Text("aaa"),
            CategoryTitle(
                title: "分类",
                titleTrailing: "更多",
                onPressMore: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击了")));
                }),
            SliverToBoxAdapter(
              child: SizedBox(height: getHeightInPercent(context, 2)),
            ),
            CategoryListWidget(),
            TestWidget(),
            CategoryTitle(
                title: "热门",
                titleTrailing: "更多",
                onPressMore: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击了")));
                }),
            PopularListWidget(
              inFav: false,
              inCart: false,
            ),
          ],
        );
      },
    );
  }
}

class PopularListWidget extends StatelessWidget {
  PopularListWidget({super.key, required this.inFav, required this.inCart});

  final _controller = Get.find<HomeController>();
  final bool inFav, inCart;

  @override
  Widget build(BuildContext context) {
    loggerSingle("PopularListWidget====build()");
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 243.0,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: _controller.productList.value?.length ?? 0,
        (BuildContext context, int index) {
          return Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: _controller.productList.value?[index].image ?? "",
                      // imageUrl: "",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                          height: 55,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "测试：" + (_controller.productList.value?[index].description ?? ""),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                _controller.productList.value?[index].name ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () => "",
                          icon: inFav
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 18,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 18,
                                )),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  color: Get.isDarkMode ? AppColorConfig.secondary : AppColorConfig.primaryDark,
                  child: inCart
                      ? const Icon(
                          Icons.shopping_cart,
                          size: 18,
                          color: AppColorConfig.white,
                        )
                      : const Icon(
                          Icons.shopping_cart_outlined,
                          size: 18,
                          color: AppColorConfig.white,
                        ),
                )
              ],
            ),
          );
        },

        // childCount: 4,
      ),
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({super.key});

  final _controller = Get.find<HomeController>();
  final List<String> imgs = [
    "https://pic.616pic.com/photoone/00/00/56/618ce8b3797b76152.jpg",
    "https://img2.baidu.com/it/u=3853345508,384760633&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=1200",
    "https://img0.baidu.com/it/u=2355991333,1840992791&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
    "https://img1.baidu.com/it/u=2493100667,3909349679&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
  ];

  @override
  Widget build(BuildContext context) {
    loggerSingle("CategoryListWidget====build()");
    return _categorySliver();
  }

  Widget _categorySliver() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: 110,
            cacheExtent: 480,
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.datumList.value?.length ?? 0,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColorConfig.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                          // imageUrl: _controller.datumList.value?[index].image ?? "",
                          imageUrl: imgs[index],
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress, strokeWidth: 3)),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.contain),
                    ),
                    // child:  CachedNetworkImage(imageUrl:  "https://img1.baidu.com/it/u=2135316162,3264555983&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500")),
                    // child:  CachedNetworkImage(imageUrl: imgs[index])),
                    Text(_controller.datumList.value?[index].name ?? "", maxLines: 1),
                    // Text( "1111"),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final String titleTrailing;
  final VoidCallback? onPressMore;

  const CategoryTitle(
      {super.key, required this.title, required this.titleTrailing, this.onPressMore});

  @override
  Widget build(BuildContext context) {
    loggerSingle("CategoryTitle====build()");
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            InkWell(
              child: Text(titleTrailing),
              onTap: onPressMore,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  HomeBanner({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();
  final List<String> imgs = [
    "https://pic.616pic.com/photoone/00/00/56/618ce8b3797b76152.jpg",
    "https://img2.baidu.com/it/u=3853345508,384760633&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=1200",
    "https://img0.baidu.com/it/u=2355991333,1840992791&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
    "https://img1.baidu.com/it/u=2493100667,3909349679&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
    "https://img2.baidu.com/it/u=823515100,3889162028&fm=253&fmt=auto&app=120&f=JPEG?w=741&h=1112",
  ];

  @override
  Widget build(BuildContext context) {
    loggerSingle("HomeBanner====build()");

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: CarouselSlider.builder(
          itemCount: _controller.banners.value?.length ?? 0,
          // itemCount: imgs.length,
          // _controller.data.banners.length
          // itemCount: 2,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return _bannerItem(index, _controller.banners.value?[index].image ?? "");
            // return _bannerItem(index, imgs[index]);
            // _controller.data.banners[index].image
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.02,
            aspectRatio: 1,
            initialPage: 0,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }

  Widget _bannerItem(int index, String imageUrl) {
    //todo:Container的属性用法？
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorConfig.lightGray,
      ),
      child: CachedNetworkImage(
        // "https://img1.baidu.com/it/u=2135316162,3264555983&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500"
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 0),
        fadeOutDuration: const Duration(milliseconds: 0),
      ),
    );
  }
}

//==========================================
class TestWidget extends StatelessWidget {
  TestWidget({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: SizedBox(
          width: 120,
          child: FloatingActionButton(
            child: Text("刷新"),
            onPressed: () {
              controller.loadHomeData();

              //测试dio 封装之后
              //  DioController dioController = DioController();
              //  dioController.loginTest();
              //  controller.loadHomeData_test();
            },
          ),
        ),
      ),
    );
  }
}
