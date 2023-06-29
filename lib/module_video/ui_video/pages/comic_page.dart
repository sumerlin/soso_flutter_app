
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

class ComicPage extends StatefulWidget{
  const ComicPage({super.key});

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    loggerSingle("_ComicPageState....build()");
    return  Scaffold(
      appBar: AppBar(
        title: Text("comic page"),
      ),
      body: Center(
        child: Text("comic page"),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}