import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class SizeConfig {
  // Fonts sizes
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  // button sizes
  static const double buttonHeight = 18.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  // Padding & Marging sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double dl = 20.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Icons sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  // Input fields
  static const double inputFielsRadius = 12.0;
  static const double spaceBtwInputFiels = 12.0;

  // Responsive size
  static const int largeScreenSize = 1366;
  static const int mediumScreenSize = 768;
  static const int smallSceenSize = 360;
  static const int customScreenSize = 1100;

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool allScreen(BuildContext context) {
    return (ResponsiveWidget.isSmallScreen(context) ||
        ResponsiveWidget.isMediumScreen(context) ||
        ResponsiveWidget.isLargeScreen(context));
  }
}
