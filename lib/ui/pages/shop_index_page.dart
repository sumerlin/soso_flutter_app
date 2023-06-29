import 'package:flutter/material.dart';

class ShopIndexPage extends StatefulWidget {
  // const HomeTabBarView({super.key});
  const ShopIndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShopIndexPageState();
  }
}

class _ShopIndexPageState extends State<ShopIndexPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        // appBar: AppBar(
        //   // title: const Text("appbar"),
        //   bottom: TabBar(
        //     tabs: [Tab(text: "aaa"), Tab(text: "bbb"), Tab(text: "ccc")],
        //     controller: _tabController,
        //   ),
        // ),
        appBar: TabBar(
          tabs: [Tab(text: "aaa"), Tab(text: "bbb"), Tab(text: "ccc")],
          controller: _tabController,
          automaticIndicatorColorAdjustment: true,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        body: TabBarView(
          children: [
            TabPage("111"),
            TabPage("222"),
            TabPage("333"),
          ],
          controller: _tabController,
        ));
  }
}

class TabPage extends StatelessWidget {
  const TabPage(this.text, {super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.blue,
      child: Container(
        color: Colors.lightGreen,
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Text(text ?? "", textScaleFactor: 5),
        ),
      ),
    );
  }
}
