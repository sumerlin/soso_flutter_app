import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';



class TestSateLifePage extends BaseTestPage{
  const TestSateLifePage({super.key});

  @override
  Widget buildBody(BuildContext context) {

    return MyHomePage();
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _countNumber() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("TestSateLife")),
      body: Row(
        children: [
          Align(
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _countNumber,
        tooltip: "点击了",
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("====initState");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("====didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("====deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("====dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("====didChangeDependencies");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("====didChangeDependencies");
  }
}
