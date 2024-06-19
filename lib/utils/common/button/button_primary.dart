import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final bool isCustom;
  final Color? background;
  final Function() onTap;
  const ButtonPrimary(
      {super.key,
      required this.title,
      this.isCustom = true,
      this.background,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return isCustom
        ? SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: onTap, child: Text(title)),
          )
        : ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: background,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
                side: BorderSide(color: background ?? AppColor.active)),
            child: Text(title));
  }
}
