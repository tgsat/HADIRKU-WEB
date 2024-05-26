import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashboardDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashboardDisplayName:
        return _customIcon(AppIcons.dashboard, itemName);
      case staffingDisplayName:
        return _customIcon(AppIcons.staffing, itemName);
      case permissionDisplayName:
        return _customIcon(AppIcons.permission, itemName);
      case authenticationDisplayName:
        return _customIcon(AppIcons.settings, itemName);
      default:
        return _customIcon(AppIcons.dashboard, itemName);
    }
  }

  Widget _customIcon(String icon, String itemName) {
    if (isActive(itemName)) {
      return SvgPicture.asset(icon,
          width: SizeConfig.dl, color: AppColor.light);
    }

    return SvgPicture.asset(icon,
        width: SizeConfig.dl,
        color: isHovering(itemName) ? AppColor.light : AppColor.lightGrey);
  }
}
