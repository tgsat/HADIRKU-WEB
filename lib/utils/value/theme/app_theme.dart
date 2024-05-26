import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme = ThemeData(
    // backgroundColor: AppColor.light,
    scaffoldBackgroundColor: AppColor.light,
    primarySwatch: Colors.orange,
    textTheme: TextThemes.textTheme,
    // appBarTheme: AppBarThemes.appBarTheme,
    checkboxTheme: CheckboxThemes.checkBoxTheme,
    elevatedButtonTheme: ElevatedButtonThemes.elevatedButtonTheme,
    outlinedButtonTheme: OutlinedButtonThemes.outlinedButtonTheme,
    inputDecorationTheme: TextFieldThemes.inputDecorationTheme,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
  );
}
