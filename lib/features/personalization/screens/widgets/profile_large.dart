import 'package:flutter/material.dart';
import 'package:hadirku_web/features/personalization/screens/profile.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/side/side_card.dart';
import 'package:hadirku_web/utils/utils.dart';

class ProfileLargeScreen extends StatelessWidget {
  const ProfileLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: !ResponsiveWidget.isLargeScreen(context),
              child: const Expanded(flex: 2, child: SideCard())),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      smallScreen: Container(),
    );
  }
}
