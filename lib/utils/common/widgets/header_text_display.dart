import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'dart:html' as html;

class HeaderTextDisplay extends StatelessWidget {
  const HeaderTextDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final itemName = menuController.activeItem.value;
        return Row(
          children: [
            Space.xm!,
            Container(
              margin:
                  EdgeInsets.only(top: SizeConfig.allScreen(context) ? 56 : 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => html.window.open(dashboardRoute, "_self"),
                    onHover: (value) {
                      value
                          ? menuController.onHover(itemName)
                          : menuController.onHover("not hovering");
                    },
                    child: Text(dashboardDisplayName,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: menuController.isHovering(itemName)
                                ? AppColor.black
                                : AppColor.black.withOpacity(0.6),
                            decoration: menuController.isHovering(itemName)
                                ? TextDecoration.underline
                                : TextDecoration.none)),
                  ),
                  Text(" > ",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: AppColor.black.withOpacity(0.6),
                          )),
                  Text(itemName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: menuController.isHovering(itemName)
                              ? AppColor.black
                              : AppColor.black.withOpacity(0.6),
                          decoration: menuController.isHovering(itemName)
                              ? TextDecoration.underline
                              : TextDecoration.none)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
