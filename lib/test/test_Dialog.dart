import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogPage"),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text("AlertDialog"),
        ),
        ElevatedButton(
          onPressed: () {
            showSimpleDialog(context);
          },
          child: Text("SimpleDialog"),
        ),
      ],
    );
  }

  Future<bool?> showAlertDialog(context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("AlertDialog"),
            content: Text("您确定要删除当前文件吗?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("确认"),
              ),
            ],
          );
        });
  }

  Future<int?> showSimpleDialog(BuildContext context) async {
    int? result = await showDialog<int>(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("SimpleDialog"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  // Navigator.pop(context, 1);
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });
    return result;
  }
}
