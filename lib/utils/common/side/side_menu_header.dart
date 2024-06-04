import 'package:flutter/material.dart';

class SideMenuHeader extends StatelessWidget {
  final String title;
  const SideMenuHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 22),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
