import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String title;
  final bool isCustom;
  final Color color;
  final Function() onTap;
  const ButtonSecondary(
      {super.key,
      required this.title,
      this.isCustom = false,
      this.color = AppColor.red,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isCustom
          ? OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color, width: 2),
                textStyle: TextStyle(color: color),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(title),
              ),
            )
          : OutlinedButton(onPressed: onTap, child: Text(title)),
    );
  }
}
