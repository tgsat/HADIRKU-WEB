import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class LayoutScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: TopNavigatorMenu(keys: scaffoldKey),
      drawer: const Drawer(width: 250, child: SideMenu()),
      body: ResponsiveWidget(
          largeScreen: const LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          )),
    );
  }
}
