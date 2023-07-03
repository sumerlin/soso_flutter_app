

import 'package:flutter/material.dart';

class PageManagerUtil{
  static void openPage(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: builder),
    );
  }
}