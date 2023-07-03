import 'package:flutter/material.dart';


abstract class BaseTestPage extends StatelessWidget {
  const BaseTestPage({super.key});

  String buildTitle() {
    return "";
  }

  AppBar? buildAppBar() {
    return null;
  }



  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    String title = buildTitle();
    AppBar? appBar = _buildAppBar();
    if(title.isEmpty && buildAppBar()==null){
      return buildBody(context);
    }
    return appBar == null
        ? Scaffold(
            body: buildBody(context),
          )
        : Scaffold(
            appBar: appBar,
            body: buildBody(context),
          );
  }

  AppBar? _buildAppBar() {
    return buildTitle().isEmpty
        ? buildAppBar()
        : AppBar(title: Text(buildTitle()), centerTitle: true);
  }
}


