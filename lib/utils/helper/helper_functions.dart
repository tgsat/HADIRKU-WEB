import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:intl/intl.dart';

class HelperFunction {
  /// [COLORS]
  static const colorDefault = Color(0xFF717171);
  static final colorIntial = {
    'A': const Color(0xFFAA00FF),
    'B': const Color(0xFF2196F3),
    'C': const Color(0xFF1DE9B6),
    'D': const Color(0xFFCDDC39),
    'E': const Color(0xFF689F38),
    'F': const Color(0xFF388E3C),
    'G': const Color(0xFFE0E0E0),
    'H': const Color(0xFFFFA000),
    'I': const Color(0xFFFBC02D),
    'J': const Color(0xFFFFEA00),
    'K': const Color(0xFF5B51D8),
    'L': const Color(0xFF5D4037),
    'M': const Color(0xFF7E57C2),
    'N': const Color(0xFF2196F3),
    'O': const Color(0xFFAA00FF),
    'P': const Color(0xFF2196F3),
    'Q': const Color(0xFF00B0FF),
    'R': const Color(0xFF00E5FF),
    'S': const Color(0xFFAA00FF),
    'T': const Color(0xFF2196F3),
    'U': const Color(0xFF64DD17),
    'V': const Color(0xFFAEEA00),
    'W': const Color(0xFFAA00FF),
    'X': const Color(0xFF25D366),
    'Y': const Color(0xFFAA00FF),
    'Z': const Color(0xFF2196F3),
  };

  static Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  static Color fixedColor(String text) {
    if (text.isEmpty) {
      return colorDefault;
    }

    var split = text[0].toUpperCase();

    return colorIntial[split] ?? colorDefault;
  }

  /// [INITALNAME]
  static String parseName(String name, int? letterLimit) {
    // separate each word
    var parts = name.split(' ');
    var initial = '';

    // check length
    if (parts.length > 1) {
      // check max limit
      if (letterLimit != null) {
        for (var i = 0; i < letterLimit; i++) {
          // combine the first letters of each word
          initial += parts[i][0];
        }
      } else {
        // this default, if word > 1
        initial = parts[0][0] + parts[1][0];
      }
    } else {
      // this default, if word <=1
      initial = parts[0][0];
    }
    return initial;
  }

  /// [ALERTDIALOG]
  static void showAlertSingle(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Oke'),
            ),
          ],
        );
      },
    );
  }

  static void showAlertDouble(String title, String message, Function() onTap) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: ResponsiveWidget.isSmallScreen(context)
                  ? double.infinity
                  : 550),
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      side: const BorderSide(color: Colors.blueGrey)),
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.lg),
                      child: Text(Dictionary.cancel))),
              ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red)),
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.lg),
                      child: Text(Dictionary.delete))),
            ],
          ),
        );
      },
    );
  }

  static void showAlertForm(
      {required bool isTransparant, required Widget child}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isTransparant ? Colors.transparent : Colors.white,
          insetPadding: const EdgeInsets.all(SizeConfig.md),
          content: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              child,
              Positioned(
                right: isTransparant ? -20 : -40,
                top: isTransparant ? -20 : -40,
                child: InkResponse(
                  onTap: () => Navigator.of(context).pop(),
                  child: CircleAvatar(
                    backgroundColor: AppColor.active,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        AppIcons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// [MATERIALNAVIGATION]
  static void navigatePushToNamed(String screen) {
    Navigator.pushNamed(Get.context!, screen);
  }

  static void navigatePushToScreen(Widget screen) {
    Navigator.push(
      Get.context!,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// [DATEFORMATED]
  static dateFormat() => DateFormat("dd/MM/yyyy");
  static dateFormatWithSecond() => DateFormat("yyyy-MM-dd HH:mm:ss");

  static DateTime getYesterday() {
    DateTime today = DateTime.now();
    return today.subtract(const Duration(days: 1));
  }

  static String formatedDate(DateTime? date, {String? format}) {
    String formating = format ?? "dd MMM yyyy";
    if (date != null) {
      return DateFormat(formating, 'id_ID').format(date);
    } else {
      return '';
    }
  }

  static String stringToDate(String date, {String? format}) {
    String formating = format ?? "dd MMM yyyy";

    return DateFormat(formating, 'id_ID').format(DateTime.parse(date));
  }

  static DateTime stringToDateTime(String dateString, String dateFormat) {
    return DateFormat(dateFormat).parse(dateString);
  }

  /// [WRAPWODGET]
  static List<Widget> wrapWidget(List<Widget> widgets, int rowSize) {
    final wrapList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrapList.add(Row(children: rowChildren));
    }
    return wrapList;
  }
}
