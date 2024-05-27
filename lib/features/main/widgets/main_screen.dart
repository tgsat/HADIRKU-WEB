import 'package:flutter/material.dart';
import 'package:hadirku_web/data/providers/app.dart';
import 'package:hadirku_web/features/main/drawer/drawer_large.dart';
import 'package:hadirku_web/features/main/drawer/drawer_medium.dart';
import 'package:hadirku_web/features/main/drawer/drawer_small.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/app_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<AppDrawerProvider>(context);
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ResponsiveWidget(
          largeScreen: DrawerLarge(),
          mediumScreen: DrawerLarge(),
          smallScreen: DrawerMedium(),
        ),
      ),
      endDrawer:
          !ResponsiveWidget.isLargeScreen(context) ? const DrawerSmall() : null,
      body: ResponsiveWidget(
        largeScreen: Container(
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            constraints: const BoxConstraints(maxWidth: 400),
            child: mainLocalNavigator()),
        mediumScreen: Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: mainLocalNavigator()),
        smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: mainLocalNavigator()),
      ),
    );
  }
}
