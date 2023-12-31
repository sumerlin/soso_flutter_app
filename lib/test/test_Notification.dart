import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';

class TestNotificationPage extends BaseTestPage {
  const TestNotificationPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestNotificationPage"),
      ),
      body: const BodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ///下面是收不到， 通知是向上通知的。
          MyNotification("Floating").dispatch(context);
        },
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (nt) {
        print("父级收到通知：" + nt.message);
        return false;
      },
      child: NotificationListener<MyNotification>(
        onNotification: (nt) {
          print("子级收到通知：" + nt.message);
          //返回true 表示终止了通知， FALSE 继续上传
          return true;
        },
        child: Column(
          children: [
            Expanded(child: ListView(children: List.generate(30, (index) => ItemWidget()).toList())),
            Builder(
              builder: (ctx) {
                return ElevatedButton(
                    onPressed: () => MyNotification("summer")..dispatch(ctx), child: Text("发送通知"));
              }
            )
          ],
        ),
      ),
    );
  }

  bool _onNotification(Notification notification) {
    // print('====dragDetails:${notification.dragDetails}'
    //     '====pixels:${notification.metrics.pixels}');
    switch (notification.runtimeType) {
      case ScrollStartNotification:
        print("开始滚动");
        break;
      case ScrollUpdateNotification:
        print("正在滚动");
        break;
      case ScrollEndNotification:
        print("滚动停止");
        break;
      case OverscrollNotification:
        print("滚动到边界");
        break;

      case MyNotification:
        var message = (notification as MyNotification).message;
        print("收到通知：" + message);
    }
    return false;
  }
}

class MyNotification extends Notification {
  MyNotification(this.message);

  String message;
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("测试"),
          ],
        ),
      ),
    );
  }
}
