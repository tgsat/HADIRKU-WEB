import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }
}
