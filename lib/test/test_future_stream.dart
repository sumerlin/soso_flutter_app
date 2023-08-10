import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

class TestFutureStreamPage extends BaseTestPage {
  TestFutureStreamPage({super.key});

  @override
  String buildTitle() {
    return "TestFutureStreamPage";
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [_baseStreamBuilder(), _buildStreamController()],
      ),
    );
  }

  Widget _baseStreamBuilder() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        StreamBuilder<int>(
          stream: loadData(),
          builder: (context, snapshot) {
            loggerSingle("StreamBuilder..." + snapshot.connectionState.toString());
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream 已关闭');
            }
          },
        ),
        ElevatedButton(
          onPressed: () => loadData(),
          child: Text("加载数据"),
        )
      ],
    );
  }

  Stream<int> loadData() {
    //常见定时器， 每1秒实例一个流对象
    // return  Stream.periodic(
    //   Duration(seconds: 1),
    //   (computationCount) => computationCount,
    // );

    Duration interval = Duration(seconds: 1);
    Stream<int> stream = Stream.periodic(interval, (data) => data);
    stream = stream.take(5); //指定发送事件个数

    return stream;
  }

  Widget _buildStreamController() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            StreamBuilder<int>(
              stream: getStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('没有Stream');
                  case ConnectionState.waiting:
                    return Text('等待数据...');
                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('Stream 已关闭');
                }
              },
            ),
            ElevatedButton(
              onPressed: () => controller.add(event++),
              child: Text("发送事件"),
            ),
            ElevatedButton(
              onPressed: () => controller.sink.add(event++),
              child: Text("sink发送事件"),
            ),
            ElevatedButton(
              onPressed: () => controller.close(),

              child: Text("关闭流"),
            ),

            ElevatedButton(
              onPressed: () => getStream(),
              child: Text("重新启动流"),
            ),
          ],
        );
      },
    );
  }

  late StreamController<int> controller;
  int event = 1;

  Stream<int> getStream() {
    controller = StreamController<int>(onListen: () {
      //StreamBuilder 内部订阅时回调，订阅只执行一次
      loggerSingle("listen...event:$event");
    },);
    ///【注意】listen 不可以多监听，内部已经订阅监听， 外部再订阅监听就会报错。
    ///【多订阅监听】使用 StreamController.broadcast();
    // StreamSubscription subscription=  controller.stream.listen((event) {
    //    loggerSingle("listen...event:$event");
    // });
    return controller.stream;
  }

}
