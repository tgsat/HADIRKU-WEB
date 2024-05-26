import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class HeaderTextDisplay extends StatelessWidget {
  const HeaderTextDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 10),
            child: Text(menuController.activeItem.value,
                style: Theme.of(context).textTheme.headlineSmall),
          ),
        ],
      ),
    );
  }
}
