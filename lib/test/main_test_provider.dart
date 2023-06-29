import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/LoggerUtil.dart';

void main() {
  runApp(Builder(builder: (BuildContext context) {
    return const MaterialApp(
      title: "",
      home: TestProvider(),
    );
  }));
}

class TestProvider extends StatelessWidget {
  const TestProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TestProvider")),
      body: Column(
        children: [
          buildProvider(context),
          buildChangeNotifierProvider(context),
        ],
      ),
    );
  }

  Widget buildProvider(BuildContext context) {
    return Provider(
        create: (ctx) => _Person(),
        child: Consumer<_Person>(builder: (ctx, person, child) {
          return Builder(builder: (context) {
            loggerSingle("buildProvider====Consumer====Builder()");
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Text(person.name)),
                FloatingActionButton(
                  onPressed: () {
                    var person = Provider.of<_Person>(ctx);
                    person.name = "我的名字";
                  },
                  child: Text("变化"),
                )
              ],
            );
          });
        }));
  }

  //监听数据变化。
  Widget buildChangeNotifierProvider(BuildContext context) {
    return ChangeNotifierProvider<_Person02>(
        create: (ctx) => _Person02(),
        child: Row(
          children: [
            Consumer<_Person02>(builder: (ctx, person, child) {
              return Builder(builder: (context) {
                loggerSingle("buildChangeNotifierProvider====Consumer====Builder()");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: Text("Consumer模式：" + person.name)),
                    FloatingActionButton(
                      onPressed: () {
                        // var person = Provider.of<_Person02>(ctx);
                        // print("person.name====" + person.name);
                        // person.name = "我的名字22";
                        // person.notifyListeners();
                        // Provider.of<_Person02>(ctx);
                        person.change();
                      },
                      child: Text("变化"),
                    ),
                    Builder(builder: (context) {
                      loggerSingle("buildChangeNotifierProvider====Consumer====测试()");
                      return Text("测试");
                    })
                  ],
                );
              });
            }),
            //选择定点更新， 第一个是传入参数， 第二个是返回数据类型。
            Selector<_Person02, String>(
              selector: (ctx, person) {
                return person.name2;
              },
              builder: (ctx, name, child) {
                loggerSingle("buildChangeNotifierProvider====Selector====Builder()");
                return Builder(builder: (context) {
                  return Text("Selector模式：" + name);
                });
              },
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: 300,
                minHeight: 100,
                maxHeight: 300,
              ).loosen(),
            )
          ],
        ));
  }
}

class _Person {
  String name = "summer";
  int age = 18;
}

class _Person02 extends _Person with ChangeNotifier {
  // String name = "summer021
  // int age = 18;
  String name2 = "name01";

  void change() {
    super.name = "summer02";
    // name2 = "name0"+Random().nextInt(10).toString();
    name2 = "name05"; //如果是固定值，是否会被通知？Consumer会，Selector不会
    notifyListeners();
  }
}
