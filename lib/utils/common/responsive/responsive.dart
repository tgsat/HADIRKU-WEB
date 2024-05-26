import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  });

  static bool isSmallScreen(BuildContext context) {
    return SizeConfig.maxWidth(context) < SizeConfig.mediumScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    return SizeConfig.maxWidth(context) >= SizeConfig.mediumScreenSize &&
        SizeConfig.maxWidth(context) < SizeConfig.largeScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return SizeConfig.maxWidth(context) > SizeConfig.largeScreenSize;
  }

  static bool isCustomSize(BuildContext context) {
    return SizeConfig.maxWidth(context) <= SizeConfig.customScreenSize &&
        SizeConfig.maxWidth(context) >= SizeConfig.mediumScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= SizeConfig.largeScreenSize) {
          return largeScreen;
        } else if (constraints.maxWidth < SizeConfig.largeScreenSize &&
            constraints.maxWidth >= SizeConfig.mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
