import 'package:flutter/material.dart';

import 'My_InheritedElement.dart';
import 'My_StatefulElement.dart';

class TestInheritedWidgetMe extends StatelessWidget {
  const TestInheritedWidgetMe({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TestInheritedWidgetMe"),
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
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     WidgetA(),
    //     WidgetB(),
    //     WidgetC(),
    //   ],
    // );
    return WidgetABC();
  }
}

class WidgetABC extends StatefulWidget {
  const WidgetABC({super.key});

  @override
  State<StatefulWidget> createState() => WidgetABCState();

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    // return super.createElement();
    return MyStatefulElement(this);
  }
}

class WidgetABCState extends State<WidgetABC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("WidgetABCState====build()");
    // InheritedWidget;
    return MyInheritedWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetA(),
          WidgetB(),
          WidgetC(),
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("WidgetABCState====initState()");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("WidgetABCState====didChangeDependencies()");
  }

  @override
  void didUpdateWidget(covariant WidgetABC oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("WidgetABCState====didUpdateWidget()");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("WidgetABCState====deactivate()");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("WidgetABCState====dispose()");
  }
}

class WidgetA extends StatefulWidget {
  const WidgetA({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_WidgetAState====initState()");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_WidgetAState====build()");
    return Text("WidgetAState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("_WidgetAState====didChangeDependencies()");
  }
}

class WidgetB extends StatefulWidget {
  const WidgetB({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetB();
}

class _WidgetB extends State<WidgetB> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_WidgetBState====initState()");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_WidgetBState====build()");
    // int? count = MyInheritedWidget.of(context, true)?.state.getCount();
    // return Text("WidgetB==count:" + count.toString());
    return Text("WidgetB==count:");

    // MyInheritedWidget? widget = MyInheritedWidget.of(context, false);
    // return Text("WidgetB==count:");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("_WidgetBState====didChangeDependencies()");
  }

  @override
  void didUpdateWidget(covariant WidgetB oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("_WidgetBState====didUpdateWidget()");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("_WidgetBState====deactivate()");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("_WidgetBState====dispose()");
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("WidgetC====build()");
    MyInheritedWidget? widget = MyInheritedWidget.of(context, false);
    return ElevatedButton(
      onPressed: () {
        // widget?.state.addCount();
      },
      child: Text("WidgetC 点击"),
    );
  }
}

class MyInheritedWidgetWrapper extends StatefulWidget {
  int count;
  Widget child;

  MyInheritedWidgetWrapper({super.key, required this.count, required this.child});

  @override
  State<StatefulWidget> createState() => MyInheritedWidgetWrapperState();
}

class MyInheritedWidgetWrapperState extends State<MyInheritedWidgetWrapper> {
  void addCount() {
    setState(() {
      widget.count++;
    });
  }

  int getCount() {
    return widget.count;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyInheritedWidget2(state: this, child: widget.child);
  }
}

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyInheritedWidget? of(BuildContext context, bool rebuild) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
        : context.findAncestorWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  InheritedElement createElement() {
    // TODO: implement createElement
    // return super.createElement();
    return MyInheritedElement(this);
  }
}

class MyInheritedWidget2 extends InheritedWidget {
  MyInheritedWidget2({super.key, required this.state, required super.child});

  MyInheritedWidgetWrapperState state;

  @override
  bool updateShouldNotify(covariant MyInheritedWidget2 oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static MyInheritedWidget2? of(BuildContext context, bool rebuild) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<MyInheritedWidget2>()
        : context.findAncestorWidgetOfExactType<MyInheritedWidget2>();
  }
}
