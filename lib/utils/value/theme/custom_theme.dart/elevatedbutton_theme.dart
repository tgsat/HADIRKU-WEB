import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonThemes {
  ElevatedButtonThemes._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColor.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColor.primary),
      padding: const EdgeInsets.symmetric(vertical: 13),
      textStyle: GoogleFonts.poppins(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.sm)),
    ),
  );
}
