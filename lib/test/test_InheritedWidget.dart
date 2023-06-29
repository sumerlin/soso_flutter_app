import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  String reference;

  Item(this.reference);
}

class _MyInherited extends InheritedWidget {
  const _MyInherited({
    key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {

    print("_MyInherited====hashCode::"+this.hashCode.toString());
    return true;
  }
}

class MyInheritedWidget extends StatefulWidget {
  const MyInheritedWidget({
    key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context, bool rebuild) {
    // return (context.dependOnInheritedWidgetOfExactType<_MyInherited>() as _MyInherited).data;

    return (rebuild
            ? context.dependOnInheritedWidgetOfExactType<_MyInherited>() as _MyInherited
            : context.findAncestorWidgetOfExactType<_MyInherited>() as _MyInherited)
        .data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  /// List of Items
  List<Item> _items = <Item>[];

  /// Getter (number of items)
  int get itemsCount => _items.length;

  /// Helper method to add an Item
  void addItem(String reference) {
    setState(() {
      _items.add(Item(reference));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInherited(
      data: this,  //rebuild state 并不会new一个新的 state ，
      child: widget.child, //不是实例化新的 ，而是使用本身的child 子组件
    );
  }
}

class MyTree extends StatefulWidget {
  const MyTree({super.key});

  @override
  _MyTreeState createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: <Widget>[
            const WidgetA(),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    print("WidgetA====build()");
    final MyInheritedWidgetState state = MyInheritedWidget.of(context, false);
    return Container(
      child: TextButton(
        child: const Text('Add Item'),
        onPressed: () {
          state.addItem('new item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    print("WidgetB====build()");
    final MyInheritedWidgetState state = MyInheritedWidget.of(context, true);
    return new Text('${state.itemsCount}');
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    print("WidgetC====build()");
    return new Text('I am Widget C');
  }
}
