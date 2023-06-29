import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_page.dart';
import 'favourite_page.dart';
import 'home_page.dart';
import 'setting_page.dart';

class IndexPage extends StatelessWidget {
  IndexPage({super.key});

  final _pageController = PageController();
  final _index = 0.obs;

  // @override
  // State<StatefulWidget> createState() => _IndexPageState();
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("summer购物"),
        centerTitle: true,
      ),
      body: PageView(
        //允许隐含滚动【也就是左右缓存】
        allowImplicitScrolling: true,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: false,
        controller: _pageController,
        // onPageChanged: (position)=>_index.value = position,
        children:  <Widget>[
          HomePage(),
          CartPage(),
          FavouritePage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "购物车"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
          ],
          currentIndex: _index.value,
          onTap: (position) {
            _index.value = position;
            _pageController.jumpToPage(position);
            // _index.value = position;
            // _pageController.animateToPage(
            //   position,
            //   duration: const Duration(milliseconds: 260),
            //   curve: Curves.fastOutSlowIn,
            // );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            Text("11111"),
            Text("22222"),
          ],
        ),
      ),
    );
  }
}


// class _IndexPageState extends State<IndexPage> {
//   // with AutomaticKeepAliveClientMixin
//   final _pageController = PageController();
//   final _index = 0.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     // super.build(context);
//     // TODO: implement build
//     return Scaffold(
//       extendBody: false,
//       extendBodyBehindAppBar: false,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("summer购物"),
//         centerTitle: true,
//       ),
//       body: PageView(
//         //允许隐含滚动【也就是左右缓存】
//         allowImplicitScrolling: true,
//         physics: const NeverScrollableScrollPhysics(),
//         pageSnapping: false,
//         controller: _pageController,
//         // onPageChanged: (position)=>_index.value = position,
//         children: const <Widget>[
//           HomePage(),
//           FavouritePage(),
//           CartPage(),
//           // SettingPage(),
//         ],
//       ),
//       bottomNavigationBar: Obx(
//         () => BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
//             BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: "购物车"),
//             BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏"),
//             // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
//           ],
//           currentIndex: _index.value,
//           onTap: (position) async {
//             // _pageController.jumpToPage(position);
//             _index.value = position;
//             _pageController.animateToPage(
//               position,
//               duration: const Duration(milliseconds: 260),
//               curve: Curves.fastOutSlowIn,
//             );
//           },
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: const [
//             Text("11111"),
//             Text("22222"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
