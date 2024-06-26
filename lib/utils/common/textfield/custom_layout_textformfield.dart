import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class CustomLayoutTextFormField extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isScreen;
  final int rightFlex;
  const CustomLayoutTextFormField({
    super.key,
    required this.title,
    required this.child,
    this.isScreen = false,
    this.rightFlex = 3,
  });

  static Widget isSmallLayout(
      BuildContext context, String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTile(title: title),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  static Widget isLargeLayout(
      BuildContext context, String title, int rightFlex, Widget child) {
    return Row(
      children: [
        Expanded(flex: 1, child: SectionTile(title: title)),
        const SizedBox(width: 10),
        Expanded(flex: rightFlex, child: child),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isScreen
        ? isLargeLayout(context, title, rightFlex, child)
        : isSmallLayout(context, title, child);
  }
}
