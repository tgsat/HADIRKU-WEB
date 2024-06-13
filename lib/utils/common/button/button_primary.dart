import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final bool isCustom;
  final Function() onTap;
  const ButtonPrimary(
      {super.key,
      required this.title,
      this.isCustom = true,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(title),
            ));
  }
}
