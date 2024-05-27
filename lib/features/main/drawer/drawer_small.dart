import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/main/drawer/drawer_horizontal_menu_item.dart';
import 'package:hadirku_web/models/main/navbar_model.dart';
import 'package:hadirku_web/utils/utils.dart';

class DrawerSmall extends StatelessWidget {
  const DrawerSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150,
      child: Material(
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Column(
                children: navBarMenuItemRoutes
                    .map((item) => DrawerHorizontalMenuItem(
                          itemName: item.name,
                          onTap: () {
                            if (!menuController.isActive(item.name)) {
                              menuController.changeActiveItemTo(item.name);
                              if (ResponsiveWidget.isSmallScreen(context)) {
                                Get.back();
                              }
                              navigationController.navigateTo(item.route);
                            }
                          },
                        ))
                    .toList(),
              ),
              DrawerHorizontalMenuItem(
                  itemName: authSignInDisplayName,
                  onTap: () {
                    html.window.open(authSignInRoute, "_blank");
                  }),
              DrawerHorizontalMenuItem(
                  itemName: authSignUpDisplayName,
                  onTap: () {
                    html.window.open(authSignUpRoute, "_blank");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
