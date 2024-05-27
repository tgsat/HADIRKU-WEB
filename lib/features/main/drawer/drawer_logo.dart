import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class DrawerLogo extends StatelessWidget {
  const DrawerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppIcons.mainLogo,
          color: AppColor.white,
          scale: 10,
        ),
        Text(Dictionary.appName.toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.white)),
      ],
    );
  }
}
