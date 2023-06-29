import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/ui/pages_shop/index_page.dart';
import 'package:flutter_app/ui/routers/AppRouter.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/**
 *  电商app
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
      initialRoute: AppRouterPath.index,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      logWriterCallback: (String text, {bool isError = false}){
       loggerSingle("Getx日志："+text);
      },
    );
  }

// @override
//   Widget build(BuildContext context) {
//   EasyLoading.init();
//     return MaterialApp(
//       title: "Shop",
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home:  IndexPage(),
//     );
//   }
}
