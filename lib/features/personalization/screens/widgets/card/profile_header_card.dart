import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String label;
  final Widget child;
  const ProfileHeaderCard(
      {super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
