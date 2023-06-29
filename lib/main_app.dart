import 'package:flutter/material.dart';
import 'ui/pages/home_index_page.dart';
import 'ui/pages/setting_index_page.dart';
import 'ui/pages/shop_index_page.dart';

void main() {
  //测试界面 线条图
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = new PageController();
  int _currIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState===build()");
    print("_MyHomePageState===_currIndex==" + _currIndex.toString());
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [],
        // leading: IconButton(
        //   onPressed: () {
        //     Fluttertoast.showToast(msg: "flutter");
        //   },
        //   icon: Icon(Icons.home),
        // ),
      ),
      drawer: const MyDrawer(),
      body: PageView(
        children: [HomeIndexPage(), ShopIndexPage(), SettingIndexPage("Settings")],
        controller: _controller,
        pageSnapping: true,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          // setState(() {
          //   _currIndex = index;
          // });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          // Fluttertoast.showToast(msg: String.fromCharCode(index));
          setState(() {
            _currIndex = index;
          });
          _controller.jumpToPage(index);
          // _controller.jumpToPage(index);
        },
        currentIndex: _currIndex,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  // const MyDrawer({super.key});
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: const [
          Text("11111"),
          Text("22222"),
        ],
      ),
    );
  }
}
