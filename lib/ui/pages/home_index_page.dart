import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/test_InheritedWidget.dart';
import 'package:flutter_app/test/test_InheritedWidget_me.dart';

import '../../test/test_Dialog.dart';
import '../../test/test_Dio.dart';
import '../../test/test_FutureBuilder.dart';
import '../../test/test_InheritedWidget02.dart';
import '../../test/test_InheritedWidget_me2.dart';
import '../../test/test_Notification.dart';


class HomeIndexPage extends StatelessWidget {
  const HomeIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("HomeIndexPage====build()");
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ItemOne(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyTree()));
                    },
                    icon: Icon(Icons.transfer_within_a_station),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestInheritedWidgetMe()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("TestInheritedWidgetMe"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestInheritedWidgetMe2()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("TestInheritedWidgetMe2"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InheritedWidgetTestPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("InheritedWidgetTestPage"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestNotificationPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("MyNotificationPage"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestFutureBuilderPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("FutureBuilderPage"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestDialogPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("DialogPage"),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DioPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("DioPage"),
                  ),
                ],
              ),
            ),
          ),
          ItemOne(),
        ],
      ),
    );
  }
}



/* ===============================ItemOne ===============================*/
class ItemOne extends StatefulWidget {
  ItemOne({super.key});

  @override
  State<StatefulWidget> createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  GlobalKey<_CustomTextState> childKey = GlobalKey(); //1. 创建 globalKey
  int count = 0;

  Person person = Person(name: "sumer", age: 30);

  void _changeData() {
    setState(() {
      count++;
    });

    // childKey.currentState?.updateDate();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_ItemOneState===build()");
    return ShareDataWidget(
      data: person,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        color: Colors.lightGreen[200],
        child: Row(
          children: [
            Expanded(
              child: Text(
                "data：" + count.toString(),
              ),
            ),
            CustomText(key: childKey),
            OutlinedButton.icon(
              // onPressed: () => _changeData(),
              // onPressed: () => setState(() {
              //   person = Person(name: '李四', age: 19);
              // }),
              // onPressed: ()=>person = Person(name: '李四', age: 19),
              // onPressed: (){
              //   person = Person(name: '李四', age: 19);
              // },

              onPressed: () => _changeData(),
              icon: Icon(Icons.add),
              label: Text("点击"),
            ),
            TextA(),
          ],
        ),
      ),
    );
  }
}

/* ===============================CustomText ===============================*/
class CustomText extends StatefulWidget {
  const CustomText({super.key});

  @override
  State<StatefulWidget> createState() => _CustomTextState();

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }
}

class _CustomTextState extends State<CustomText> {
  int count = 0;
  Person? person;

  void updateDate() {
    setState(() {
      count++;
    });
    // ShareDataWidget.of(context).data  = Person(name: '李四', age: 19);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // print(person.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("_CustomTextState===build()");
    person = ShareDataWidget.of(context)!.data; //获取到上下文中的值
    // TODO: implement build
    return Row(
      children: [
        Builder(builder: (cc) {
          print("Text1");
          return Text("Text:" + count.toString());
        }),
        Builder(builder: (cc) {
          print("Text2");
          // return Text('Text: ${person?.name}');
          return Text('Text: ');
        }),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_CustomTextState===didChangeDependencies()");
  }
}

class ShareDataWidget extends InheritedWidget {
  final Person data;

  ////需要在子树中共享的数据
  const ShareDataWidget({super.key, required this.data, required super.child});

  //定义一个便捷方法，方便子树中的widget获取共享数据
  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }

  //提供一个 “of” 静态方法来获取其对象
  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

class TextA extends StatelessWidget {
  const TextA({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("TextA=====build()");
    return Text("textA");
  }
}
