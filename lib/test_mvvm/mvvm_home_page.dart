import 'package:flutter/material.dart';
import 'package:flutter_app/test_mvvm/MvvmStatus.dart';
import 'package:flutter_app/test_mvvm/mvvm_home_controller.dart';
import 'package:get/get.dart';

import 'widgets/general_exception.dart';
import 'widgets/internet_exceptions_widget.dart';

class MvvmHomePage extends StatelessWidget {
  const MvvmHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late MvvmHomeController controller = Get.put(MvvmHomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          ListView.builder(
            itemCount: controller.userListModel.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              printInfo(info: "_BodyState===build()");
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(controller.userListModel.data![index].avatar ?? ""),
                  ),
                  title: Text(controller.userListModel.data![index].firstName.toString()),
                  subtitle: Text(controller.userListModel.data![index].lastName ?? ""),
                ),
              );
            },
          ),
          Center(
            child: Visibility(
              visible: controller.status == Status.LOADING,
              child: CircularProgressIndicator(),
            ),
          ),
          Visibility(
            visible: controller.status == Status.ERROR,
            child: GeneralExceptionWidget(
              onPress: () {
                controller.reloadUserList();
              },
            ),
          ),
          Visibility(
            visible: controller.status == Status.UNNETWORK,
            child: InterNetExceptionWidget(
              onPress: () {
                controller.reloadUserList();
              },
            ),
          ),
          Positioned(
              left: 50,
              bottom: 50,
              child: FloatingActionButton(
                tooltip: "error",
                child: Text("error"),
                onPressed: () {
                  controller.showError();
                },
              )),
          Positioned(
              right: 50,
              bottom: 50,
              child: FloatingActionButton(
                tooltip: "other",
                child: Text("other"),
                onPressed: () {
                  controller.showErrorOther();
                },
              )),
        ],
      );
    });
  }

// return ListView.builder(
// itemCount: controller.userListModel.value.data?.length ?? 0,
// itemBuilder: (BuildContext context, int index) {
// printInfo(info: "_BodyState===build()");
// return Card(
// child: ListTile(
// leading: CircleAvatar(
// backgroundImage: NetworkImage(
// "https://img2.baidu.com/it/u=976490495,1369803367&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500"),
// ),
// title: Text(
// "111" + controller.userListModel.value.data![index].firstName.toString()),
// subtitle: Text("222"),
// ),
// );
// },
// );
// });
}
