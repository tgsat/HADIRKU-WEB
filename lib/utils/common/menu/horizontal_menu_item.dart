import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;
  const HorizontalMenuItem({super.key, required this.itemName, this.onTap});

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
              color: menuController.isHovering(itemName)
                  ? AppColor.lightGrey.withOpacity(0.1)
                  : Colors.transparent,
              child: Row(
                children: [
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
                          color: AppColor.light,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                    ),
                  ),
                  SizedBox(width: SizeConfig.maxWidth(context) / 88),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: Text(itemName,
                            style: theme.titleLarge!.apply(
                                color: menuController.isHovering(itemName)
                                    ? AppColor.light
                                    : AppColor.lightGrey)))
                  else
                    Flexible(
                        child: Text(itemName,
                            style:
                                theme.titleLarge!.apply(color: AppColor.light)))
                ],
              ),
            )));
  }
}
