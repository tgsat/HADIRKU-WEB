import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirku_web/utils/utils.dart';

class ButtonAdittional extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ButtonAdittional({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    late String svg;
    late Color color;
    switch (title) {
      case Dictionary.save:
        svg = AppIcons.save;
        color = AppColor.success;
      case Dictionary.update:
        svg = AppIcons.edit;
        color = AppColor.warning;
      case Dictionary.add:
        svg = AppIcons.add;
        color = AppColor.info;
      case Dictionary.delete:
        svg = AppIcons.trash;
        color = AppColor.error;
      case Dictionary.deleteAccount:
        svg = AppIcons.trash;
        color = AppColor.error;
    }
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            side: BorderSide(color: color)),
        child: Row(
          children: [
            SvgPicture.asset(svg, width: SizeConfig.dl, color: Colors.white),
            const SizedBox(width: 6),
            Text(title),
          ],
        ));
  }
}
