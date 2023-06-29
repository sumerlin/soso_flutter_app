import 'package:flutter/material.dart';

import '../../../utils/LoggerUtil.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("_ComicPageState....build()");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("用户中心"),
      ),
      body: ListView(
        children: [
          ListTile(title: Text("视频收藏"), trailing: Icon(Icons.edit)),
          ListTile(title: Text("观看历史"), trailing: Icon(Icons.edit)),
          ListTile(title: Text("个人信息"), trailing: Icon(Icons.edit)),
          ListTile(title: Text("设置"), trailing: Icon(Icons.edit)),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
