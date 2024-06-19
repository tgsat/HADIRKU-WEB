import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String label;
  final Widget child;
  final Widget button;
  const ProfileHeaderCard(
      {super.key,
      required this.label,
      required this.child,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              button,
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
