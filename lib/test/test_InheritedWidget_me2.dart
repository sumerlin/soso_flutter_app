import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestInheritedWidgetMe2 extends StatelessWidget {
  const TestInheritedWidgetMe2({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TestPage"),
      ),
      body: const BodyWidget(),
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
    return const WidgetABC();
  }
}

class WidgetABC extends StatefulWidget {
  const WidgetABC({super.key});

  @override
  State<StatefulWidget> createState() => WidgetABCState();
}

class WidgetABCState extends State<WidgetABC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("WidgetABCState====build()");
    int data = 0;
    return MyInheritedWidget(
      data: data,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetA(),
          WidgetB(),
          WidgetC(),
          Builder(
            builder: (c) {
              // MyInheritedWidget.of(c, true);
              return IconButton(
                  onPressed: () {
                    // setState(() {
                    // });
                    // ++data;
                    // MyInheritedWidget.of(context, true)?.data++;
                    MyInheritedWidget? widget = MyInheritedWidget.of(c, true);
                    int? data = ++widget?.dataValueNotifier.value;
                    widget?.updateData(data!);
                  },
                  icon: Icon(Icons.add));
            },
          ),
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

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("WidgetA====build()");
    // int? getData =  MyInheritedWidget.of(context, true)?.data;
    return Text("WidgetA");
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
    // return Text("WidgetB==count:");
    // MyInheritedWidget? widget = MyInheritedWidget.of(context, false);
    return ValueListenableBuilder<int>(
      valueListenable: MyInheritedWidget.of(context, true)!.dataValueNotifier,
      builder: (c, int data, child) {
        return Text("WidgetB==" + data.toString());
      },
    );
    // MyInheritedWidget? widget = MyInheritedWidget.of(context, false);
    // return Text("WidgetB==" + widget!._dataValueNotifier.value.toString());
    //
    // // MyInheritedWidget? widget = MyInheritedWidget.of(context, false);
    // // return Text("WidgetB==count:");
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
        MyInheritedWidget.of(context, true)?.updateData(20);
      },
      child: Text("WidgetC 点击"),
    );
  }
}

// class MyInheritedWidgetWrapper extends StatefulWidget {
//   int count;
//   Widget child;
//
//   MyInheritedWidgetWrapper({super.key, required this.count, required this.child});
//
//   @override
//   State<StatefulWidget> createState() => MyInheritedWidgetWrapperState();
// }
//
// class MyInheritedWidgetWrapperState extends State<MyInheritedWidgetWrapper> {
//   void addCount() {
//     setState(() {
//       widget.count++;
//     });
//   }
//
//   int getCount() {
//     return widget.count;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MyInheritedWidget(state: this, child: widget.child);
//   }
// }

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({super.key, required int data, required Widget child})
      : _dataValueNotifier = ValueNotifier(data),
        super(child: child);

  // : _dataValueNotifier = ValueNotifier<int>(data),
  //   super(child: child);

  // _dataValueNotifier = ValueNotifier<int>(data);

  // int data;

  final ValueNotifier<int> _dataValueNotifier;

  ValueNotifier<int> get dataValueNotifier => _dataValueNotifier;
   int dataTemp = 0;

  void updateData(int data) {
    dataTemp++;
    _dataValueNotifier.value = data;
  }
  @override
  InheritedElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  // MyInheritedWidgetWrapperState state;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    // return true;
    print("MyInheritedWidget====updateShouldNotify()");
    print("MyInheritedWidget====hashCode::" + this.hashCode.toString());

    // return data != oldWidget.data;

    // return oldWidget.dataValueNotifie != dataValueNotifie;
    return true;
  }

  // static MyInheritedWidget? of(BuildContext context, bool rebuild) {
  //   return rebuild
  //       ? context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
  //       : context.findAncestorWidgetOfExactType<MyInheritedWidget>();
  // }
  static MyInheritedWidget? of(BuildContext context, bool rebuild) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    // InheritedElement? element =  context.getElementForInheritedWidgetOfExactType<MyInheritedWidget>();
    // MyInheritedWidget widget = element?.widget as MyInheritedWidget;
    // return widget;
  }
}
