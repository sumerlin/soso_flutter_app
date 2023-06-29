import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedWidgetTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedWidgetTestPageState();
  }
}

class _InheritedWidgetTestPageState extends State<InheritedWidgetTestPage> {
  int count = 5;

  @override
  Widget build(BuildContext context) {
    print("_InheritedWidgetTestPageState---build");
    return Scaffold(
      appBar: AppBar(
        title: Text("inheritedWidget"),
      ),
      body: Center(
        child: Column(
          children: [
            _inheritedWidget(),
            ElevatedButton(
              child: Text("+"),
              //每点击一次，将count+1，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            ),
            ElevatedButton(
              child: Text("-"),
              //每点击一次，将count-1，然后重新build,ShareDataWidget的data将被更新
              // onPressed: () => setState(() => --count,),
              onPressed: () => count--,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "tosecond_tag",
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => InheritedWidgetTest2Page())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  Widget _inheritedWidget() {
    return ShareDataWidget(
      //使用ShareDataWidget
      data: count,
      child: _childWidget(),
    );
  }

  Widget _childWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: TestInheritedWidget(), //子widget中依赖ShareDataWidget
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Test2InheritedWidget(), //子widget中依赖ShareDataWidget
        ),
      ],
    );
  }
}

class InheritedWidgetTest2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedWidgetTest2PageState();
  }
}

class _InheritedWidgetTest2PageState extends State<InheritedWidgetTest2Page> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("_InheritedWidgetTest2PageState---build");
    return Scaffold(
        appBar: AppBar(
          title: Text("inheritedWidget"),
        ),
        body: Center(
          child: Column(
            children: [
              _inheritedWidget(),
              ElevatedButton(
                child: Text("+"),
                //每点击一次，将count+1，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              ),
              ElevatedButton(
                child: Text("-"),
                //每点击一次，将count-1，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => --count),
              ),
            ],
          ),
        ));
  }

  Widget _inheritedWidget() {
    return ShareDataWidget(
      //使用ShareDataWidget
      data: count,
      child: _childWidget(),
    );
  }

  Widget _childWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: TestInheritedWidget(), //子widget中依赖ShareDataWidget
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Test2InheritedWidget(), //子widget中依赖ShareDataWidget
        ),
      ],
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({super.key, required this.data, required Widget child}) : super(child: child);

  int? data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType(); //该方法沿着Element树，去找最近的CounterElement , 然后从Element中取出的Widget对象
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    // return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget(子widget didChangeDependencies方法有没有走)
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class TestInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __TestWidgetState();
  }
}

class __TestWidgetState extends State<TestInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    print("Test1InheritedWidget---build");
    //使用InheritedWidget中的共享数据
    return Text("StatefulWidget=====" + ShareDataWidget.of(context)!.data.toString()); //显示data
  }

  ///子树收到改变通知s
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    print("执行didChangeDependencies");
  }
}

class Test2InheritedWidget extends StatelessWidget {
  const Test2InheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Test2InheritedWidget---build");
    return Text("StatelessWidget=====" + ShareDataWidget.of(context)!.data.toString()); //显示data
  }
}
