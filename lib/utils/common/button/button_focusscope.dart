import 'package:flutter/material.dart';

class ButtonFocusScope extends StatelessWidget {
  final Widget child;
  const ButtonFocusScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
