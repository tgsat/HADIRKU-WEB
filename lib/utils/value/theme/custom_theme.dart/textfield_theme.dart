import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldThemes {
  TextFieldThemes._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.grey,
    suffixIconColor: AppColor.grey,
    labelStyle: GoogleFonts.poppins()
        .copyWith(fontSize: SizeConfig.fontSizeMd, color: AppColor.black),
    hintStyle: GoogleFonts.poppins()
        .copyWith(fontSize: SizeConfig.fontSizeSm, color: AppColor.black),
    errorStyle: GoogleFonts.poppins().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AppColor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 1, color: AppColor.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 1, color: AppColor.grey),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 1, color: AppColor.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 1, color: AppColor.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 1, color: AppColor.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SizeConfig.sm),
      borderSide: const BorderSide(width: 2, color: AppColor.warning),
    ),
  );
}
