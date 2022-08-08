import 'package:flutter/material.dart';

class ScreenSize {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getHeightAppBar(BuildContext context, AppBar appbar) {
    return MediaQuery.of(context).size.height - appbar.preferredSize.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
