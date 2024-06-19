import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class ResponsiveLayoutWidget {
  static Widget axis({required List<Widget> children}) {
    return ResponsiveWidget.isLargeScreen(Get.context!)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
  }

  static Widget space(double space) {
    return ResponsiveWidget.isLargeScreen(Get.context!)
        ? SizedBox(height: space)
        : SizedBox(width: space);
  }

  static Widget expanded({required Widget child}) {
    return ResponsiveWidget.isLargeScreen(Get.context!)
        ? child
        : Expanded(child: child);
  }
}
