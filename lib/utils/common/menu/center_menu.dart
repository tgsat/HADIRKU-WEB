import 'package:flutter/material.dart';

class CenterMenuWidget extends StatelessWidget {
  final bool isCenter;
  final Widget child;
  const CenterMenuWidget(
      {super.key, this.isCenter = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return (isCenter) ? Center(child: child) : child;
  }
}
