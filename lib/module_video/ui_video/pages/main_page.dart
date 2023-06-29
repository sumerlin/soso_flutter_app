import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module_video/ui_video/pages/user_page.dart';
import 'package:get/get.dart';

import 'category_page.dart';
import 'comic_page.dart';
import 'good_look_page.dart';
import 'index_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pageController = PageController();
  var _pagePosition = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            IndexPage(),
            GoodLookPage(),
            CategoryPage(),
            // ComicPage(),
            UserPage(),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: "好看"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              // BottomNavigationBarItem(icon: Icon(Icons.draw), label: "漫画"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "用户"),
            ],
            currentIndex: _pagePosition.value,
            onTap: (index) {
              _pagePosition.value = index;
              _pageController.jumpToPage(index);
            },
          ),
        ));
  }
}
