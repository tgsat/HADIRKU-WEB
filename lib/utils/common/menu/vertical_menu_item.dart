import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VertticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;
  const VertticalMenuItem({super.key, required this.itemName, this.onTap});

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
        child: Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: menuController.isHovering(itemName)
                      ? AppColor.active.withOpacity(0.1)
                      : menuController.isActive(itemName)
                          ? AppColor.active
                          : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!menuController.isActive(itemName))
                        Flexible(
                            child: Text(itemName,
                                style: theme.labelLarge!.apply(
                                    color: menuController.isHovering(itemName)
                                        ? AppColor.active
                                        : menuController.isActive(itemName)
                                            ? AppColor.white
                                            : AppColor.darkerGrey)))
                      else
                        Flexible(
                            child: Text(itemName,
                                style: theme.labelLarge!.apply(
                                    color: menuController.isActive(itemName)
                                        ? AppColor.white
                                        : AppColor.active)))
                    ],
                  ),
                ],
              ),
            )));
  }
}
