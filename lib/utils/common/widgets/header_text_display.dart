import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class HeaderTextDisplay extends StatelessWidget {
  const HeaderTextDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final itemName = menuController.activeItem.value;
    return Row(
      children: [
        Space.xm!,
        Container(
          margin: EdgeInsets.only(top: SizeConfig.allScreen(context) ? 56 : 20),
          child: Text("$dashboardDisplayName > $itemName",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.black.withOpacity(0.6),
                  decoration: TextDecoration.none)),
        ),
      ],
    );
  }
}
