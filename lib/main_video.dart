
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'module_video/ui_video/routers/AppRouter.dart';
import 'utils/LoggerUtil.dart';

/**
 *  视频app
 */
void main() {
  //测试界面 线条图
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    return GetMaterialApp(
      title: "Flutter Shop",
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      // ),
      getPages: AppRouter.pageList(),
      initialRoute: AppRouterPath.main,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      logWriterCallback: (String text, {bool isError = false}) {
        loggerSingle("Getx日志：" + text);
      },
    );
  }

}