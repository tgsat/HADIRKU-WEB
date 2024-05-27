import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class DrawerHorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;
  const DrawerHorizontalMenuItem(
      {super.key, required this.itemName, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Row(
          children: [
            if (ResponsiveWidget.isSmallScreen(context))
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 4,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: AppColor.dark,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4))),
                ),
              ),
            if (ResponsiveWidget.isSmallScreen(context))
              SizedBox(width: SizeConfig.maxWidth(context) / 60),
            if (!menuController.isActive(itemName))
              Text(itemName,
                  style: theme.titleMedium!.apply(
                      color: (menuController.isHovering(itemName) ||
                              menuController.isActive(itemName))
                          ? ResponsiveWidget.isSmallScreen(context)
                              ? AppColor.dark
                              : AppColor.light
                          : ResponsiveWidget.isSmallScreen(context)
                              ? AppColor.dark.withOpacity(0.6)
                              : AppColor.light.withOpacity(0.6)))
            else
              Text(itemName,
                  style: theme.titleMedium!.apply(
                      color: ResponsiveWidget.isSmallScreen(context)
                          ? AppColor.dark
                          : AppColor.light))
          ],
        ),
      ),
    );
  }
}
