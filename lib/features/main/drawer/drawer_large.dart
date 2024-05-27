import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/main/drawer/drawer_horizontal_menu_item.dart';
import 'package:hadirku_web/features/main/drawer/drawer_logo.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../models/main/navbar_model.dart';

// for same tab in same page ["routeName or uri, _self"]
// for new tab in same page [html.window.open(routeName or uri, "_blank")]
class DrawerLarge extends StatelessWidget {
  const DrawerLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColor.primary,
      child: Row(
        children: [
          const DrawerLogo(),
          Space.xm!,
          Row(
            children: navBarMenuItemRoutes
                .map((item) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: DrawerHorizontalMenuItem(
                          itemName: item.name,
                          onTap: () {
                            if (item.route == initialRoute) {
                              Get.toNamed(initialRoute);
                            }
                            if (!menuController.isActive(item.name)) {
                              menuController.changeActiveItemTo(item.name);

                              navigationController.navigateTo(item.route);
                            }
                          }),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: DrawerHorizontalMenuItem(
                    itemName: authSignInDisplayName,
                    onTap: () {
                      html.window.open(authSignInRoute, "_blank");
                    }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: DrawerHorizontalMenuItem(
                    itemName: authSignUpDisplayName,
                    onTap: () {
                      html.window.open(authSignUpRoute, "_blank");
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
