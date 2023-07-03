import 'package:flutter/material.dart';
import 'package:flutter_app/test/test_Dialog.dart';
import 'package:flutter_app/test/test_storage.dart';

import 'test/bloc/test_bloc_page.dart';
import 'test/test_FutureBuilder.dart';
import 'test/test_Notification.dart';
import 'test/test_RenderObject.dart';
import 'test/test_state_life.dart';
import 'test/test_thread.dart';
import 'utils/PageManagerUtil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _TestPage(),
    );
  }
}

class _TestPage extends StatefulWidget {
  @override
  State<_TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<_TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Demo Test'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("test_state_life"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestSateLifePage()),
          ),
          ListTile(
            title: Text("test_FutureBuilder"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestFutureBuilderPage()),
          ),

          ListTile(
            title: Text("test_RenderObject"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestRenderObjectPage()),
          ),
          ListTile(
            title: Text("test_Dialog"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestDialogPage()),
          ),
          ListTile(
            title: Text("test_Notification"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestNotificationPage()),
          ),
          ListTile(
            title: Text("test_bloc_page"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestBlocPage()),
          ),

          ListTile(
            title: Text("test_thread"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestThreadPage()),
          ),
          ListTile(
            title: Text("test_storage"),
            onTap: () => PageManagerUtil.openPage(context, (context) => TestStoragePage()),
          ),
        ],
      ),
    );
  }
}
