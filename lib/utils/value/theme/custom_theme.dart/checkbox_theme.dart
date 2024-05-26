import 'package:flutter/material.dart';

class CheckboxThemes {
  CheckboxThemes._();

  static CheckboxThemeData checkBoxTheme = CheckboxThemeData(
      side: BorderSide(width: 2, color: Colors.black.withOpacity(0.6)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        } else {
          return Colors.transparent;
        }
      }));
}
