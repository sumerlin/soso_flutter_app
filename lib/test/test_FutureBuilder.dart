import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderPage"),
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return FutureBuilder<String>(
      future: getNetData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Center(
          child: ColoredBox(
            color: Colors.lime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                show(snapshot),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget show(AsyncSnapshot<String> snapshot) {
    //执行结束
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return Text("错误");
      } else {
        return Text("加载结束 成功");
      }
    } else if (snapshot.connectionState == ConnectionState.active) {
      return Text("正在加载中.active..");
    } else {
      return Text("正在加载中...");
    }
  }

  Future<String> getNetData() async {
    return Future.delayed(Duration(seconds: 2), () => "我来自网络加载数据");
  }
}
