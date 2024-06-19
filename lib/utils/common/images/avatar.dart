import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class Avatar extends StatelessWidget {
  final String title;
  final int? count;
  const Avatar({super.key, required this.title, this.count});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 0,
      backgroundColor: HelperFunction.randomColor(),
      foregroundColor: Colors.white,
      child: Text(HelperFunction.parseName(title, count).toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
