import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/setting_detail_page.dart';

class SettingIndexPage extends StatelessWidget {
  const SettingIndexPage(String this.title, {super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title ?? ""),
        ElevatedButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SettingDetailPage(),
                  ),
                ),
            child: const Text("点击"))
      ],
    );
  }
}
