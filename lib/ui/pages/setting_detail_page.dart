import 'package:flutter/material.dart';

class SettingDetailPage extends StatelessWidget {
  SettingDetailPage({super.key});

  List itmes = List.filled(30, String);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        //可伸缩空间
        flexibleSpace: const FlexibleSpaceBar(
          title: Text("居中标题"),
          centerTitle: true,
          // background: ColoredBox(color: Colors.green,),
        ),
        leading: const BackButton(
            // onPressed: () => {Navigator.pop(context)},
            // icon: const Icon(Icons.arrow_back_outlined),
            ),
        title: Container(
          child: Text("标题"),
          alignment: Alignment.centerLeft,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        // alignment: Alignment.topLeft,
        color: Colors.grey,
        child: ListView(
            //类型转化
            children: itmes
                .map(
                  (e) => Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "aaa",
                          textScaleFactor: 2.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.green,
                          child: const Text(
                            "bbb",
                            textScaleFactor: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList()),
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   // mainAxisSize: MainAxisSize.max,
      //   children: [
      //     Container(
      //       color: Colors.blue,
      //       child: Text("Setting", textScaleFactor: 2),
      //     ),
      //     Text("SettingDetailPage", textScaleFactor: 2),
      //   ],
    );
  }
}
