import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/app_drawer.dart';
import 'drawer_logo.dart';

class DrawerMedium extends StatelessWidget {
  const DrawerMedium({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<AppDrawerProvider>(context);
    return Container(
      color: AppColor.primary,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const DrawerLogo(),
          Space.xm!,
          ButtonOpacity(
            onTap: () {
              drawerProvider.key.currentState!.openEndDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
