import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/LoggerUtil.dart';
import 'base/base_test_page.dart';

class TestThreadPage extends BaseTestPage {
  const TestThreadPage({super.key});

  @override
  String buildTitle() {
    return "TestThreadPage";
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () => doCompute(), child: Text("compute")),
          ElevatedButton(onPressed: () => doIsolate(), child: Text("Isolate")),
        ],
      ),
    );
  }

  void doCompute() {
    loggerSingle("Isolate.current..." + Isolate.current.hashCode.toString());
    Future<String> result = compute<int, String>((message) => doTask(message), 1);
    result.then((value) => loggerSingle("value..." + value));
  }

  String doTask(int num) {
    loggerSingle("Isolate.current..." + Isolate.current.hashCode.toString());
    return "summer";
  }

  void doIsolate() async {
    loggerSingle("doIsolate...Isolate.current..." + Isolate.current.hashCode.toString());
    //【1】实例化一个 child 客服端监听端口
    ReceivePort receivePort = ReceivePort();

    //【2】设置发送端口
    Isolate isolate = await Isolate.spawn(doIsolateTask, receivePort.sendPort);
    //【3】监听端口数据端口
    receivePort.listen((message) {
      loggerSingle("value..." + message.toString());

      //【注意】用完记得释放资源
      receivePort.close();
      isolate.kill();
    });
  }

  void doIsolateTask(SendPort sendPort) {
    loggerSingle("doIsolateTask...solate.current..." + Isolate.current.hashCode.toString());

    sendPort.send(1000);
  }
}
