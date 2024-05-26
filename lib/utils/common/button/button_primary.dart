import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final bool withSizedBox;
  final Function() onTap;
  const ButtonPrimary(
      {super.key,
      required this.title,
      this.withSizedBox = true,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return withSizedBox
        ? SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: onTap, child: Text(title)),
          )
        : ElevatedButton(onPressed: onTap, child: Text(title));
  }
}
