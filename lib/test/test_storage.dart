import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestStoragePage extends BaseTestPage {
  const TestStoragePage({super.key});



  @override
  String buildTitle() {
    return "TestStoragePage";
  }


  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () => writeFile(), child: Text("write file")),
          ElevatedButton(onPressed: () => readFile(), child: Text("read file")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(onPressed: () => writeSP(), child: Text("write sp")),
          ElevatedButton(onPressed: () => readSP(), child: Text("read sp")),
          ElevatedButton(onPressed: () => deleteSP(), child: Text("delete sp")),
        ],
      ),
    );
  }

  Future<File> getFile() async {
    // 获取应用目录
    // final Directory dir = await getApplicationDocumentsDirectory();
    final Directory dir = await getTemporaryDirectory();
    String filePath = dir.path;
    loggerSingle(filePath);
    return File('$filePath/summer.txt');
  }

  void writeFile() async {
    File file = await getFile();
    await file.writeAsString("summer is good boy!");
    loggerSingle("writeFile...write success");
  }

  void readFile() async {
    String result = await (await getFile()).readAsString();
    loggerSingle("readFile...$result");
  }

  void writeSP() async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an integer value to 'counter' key.
    await prefs.setInt('counter', 10);
    // Save an boolean value to 'repeat' key.
    await prefs.setBool('repeat', true);
    // Save an double value to 'decimal' key.
    await prefs.setDouble('decimal', 1.5);
    // Save an String value to 'action' key.
    await prefs.setString('action', 'Start');
    // Save an list of strings to 'items' key.
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
    loggerSingle("writeSp...write success");

  }

  void readSP() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
    final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
    final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
    final List<String>? items = prefs.getStringList('items');
    loggerSingle('readSp...$counter...$repeat...$decimal...$action...$items');
  }

  void deleteSP()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSuccess = await prefs.remove('items');
    loggerSingle('deleteSP...${isSuccess?'成功':'失败'}');

  }


}
