import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarThemes {
  AppBarThemes._();

  static final appBarTheme = AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.secondary,
      iconTheme:
          const IconThemeData(color: AppColor.light, size: SizeConfig.iconMd),
      titleTextStyle: Theme.of(Get.context!)
          .textTheme
          .headlineSmall!
          .apply(color: AppColor.light));
}
