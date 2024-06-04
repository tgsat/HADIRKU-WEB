import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class HeaderTextDisplay extends StatelessWidget {
  const HeaderTextDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: !ResponsiveWidget.isSmallScreen(context) ? 30 : 0),
      child: Obx(
        () => Text(menuController.activeItem.value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
