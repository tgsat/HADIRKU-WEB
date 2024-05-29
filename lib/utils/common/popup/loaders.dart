import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class Loaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.grey.withOpacity(0.9)),
          child: Center(
              child: Text(message,
                  style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    final theme = Theme.of(Get.context!).textTheme;
    Get.snackbar(
      '',
      '',
      titleText:
          Text(title, style: theme.bodyLarge!.apply(color: AppColor.white)),
      messageText:
          Text(message, style: theme.bodyMedium!.apply(color: AppColor.white)),
      isDismissible: true,
      shouldIconPulse: true,
      maxWidth:
          ResponsiveWidget.isSmallScreen(Get.context!) ? double.infinity : 600,
      dismissDirection: DismissDirection.up,
      colorText: AppColor.white,
      backgroundColor: AppColor.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: SvgPicture.asset(AppIcons.check,
          width: SizeConfig.md, color: AppColor.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    final theme = Theme.of(Get.context!).textTheme;
    Get.snackbar(
      '',
      '',
      titleText:
          Text(title, style: theme.bodyLarge!.apply(color: AppColor.white)),
      messageText:
          Text(message, style: theme.bodyMedium!.apply(color: AppColor.white)),
      isDismissible: true,
      shouldIconPulse: true,
      maxWidth:
          ResponsiveWidget.isSmallScreen(Get.context!) ? double.infinity : 600,
      dismissDirection: DismissDirection.up,
      colorText: AppColor.white,
      backgroundColor: AppColor.warning,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: SvgPicture.asset(AppIcons.warning,
          width: SizeConfig.md, color: AppColor.white),
    );
  }

  static warningWifiSnackBar({required title, message = '', duration = 3}) {
    final theme = Theme.of(Get.context!).textTheme;
    Get.snackbar(
      '',
      '',
      titleText:
          Text(title, style: theme.bodyLarge!.apply(color: AppColor.white)),
      messageText:
          Text(message, style: theme.bodyMedium!.apply(color: AppColor.white)),
      isDismissible: true,
      shouldIconPulse: true,
      maxWidth:
          ResponsiveWidget.isSmallScreen(Get.context!) ? double.infinity : 600,
      dismissDirection: DismissDirection.up,
      colorText: AppColor.white,
      backgroundColor: AppColor.warning,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: SvgPicture.asset(AppIcons.wifi,
          width: SizeConfig.md, color: AppColor.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    final theme = Theme.of(Get.context!).textTheme;
    Get.snackbar(
      '',
      '',
      titleText:
          Text(title, style: theme.bodyLarge!.apply(color: AppColor.white)),
      messageText:
          Text(message, style: theme.bodyMedium!.apply(color: AppColor.white)),
      isDismissible: true,
      shouldIconPulse: true,
      maxWidth:
          ResponsiveWidget.isSmallScreen(Get.context!) ? double.infinity : 600,
      dismissDirection: DismissDirection.up,
      colorText: AppColor.white,
      backgroundColor: AppColor.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: SvgPicture.asset(AppIcons.close,
          width: SizeConfig.md, color: AppColor.white),
    );
  }
}
