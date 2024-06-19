import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(width: SizeConfig.maxWidth(context) / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        AppIcons.mainLogo,
                        width: 28,
                      ),
                    ),
                    Flexible(
                      child: Text(Dictionary.appName.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.active)),
                    ),
                    SizedBox(width: SizeConfig.maxWidth(context) / 48),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          if (ResponsiveWidget.isSmallScreen(context))
            Divider(
              color: AppColor.dark.withOpacity(.1),
            ),
          const SideMenuHeader(title: 'Main Menu'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMainMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authSignInRoute) {
                        Get.offAllNamed(authSignInRoute);
                        menuController.changeActiveItemTo(dashboardDisplayName);
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          ),
          const SideMenuHeader(title: 'Account'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideAccountMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          ),
        ],
      ),
    );
  }
}
