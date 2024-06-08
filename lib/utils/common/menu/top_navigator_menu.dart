import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../features/personalization/controllers/user_controller.dart';

class TopNavigatorMenu extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> keys;
  const TopNavigatorMenu({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppBar(
      automaticallyImplyLeading: false,
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                keys.currentState?.openDrawer();
              }),
      title: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Image(
                      image: AssetImage(AppIcons.mainLogo),
                      width: 28,
                    ),
                  ),
                  Text(Dictionary.appName.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 20,
                              color: AppColor.dark,
                              fontWeight: FontWeight.bold)),
                ],
              )),
          const HeaderTextDisplay(),
          Expanded(child: Container()),
          ButtonOpacity(
              child: SvgPicture.asset(
                AppIcons.notification,
                width: SizeConfig.dl,
                color: AppColor.dark,
              ),
              onTap: () {}),
          const SizedBox(width: 6),
          UserProfileTile(
            child: PopupMenuButton(
              itemBuilder: (cxt) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: AppColor.darkerGrey),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Keluar',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: AppColor.darkerGrey),
                  ),
                ),
              ],
              onSelected: (val) {
                if (val == 0) {
                  debugPrint("Edit Profile menu is select $val.");
                } else if (val == 1) {
                  debugPrint("Logout menu is select $val.");
                  controller.logoutAccountWarningPopUp(() {
                    controller.authRepository.logout();
                    Navigator.of(context).pop();
                  });
                }
              },
              child: SvgPicture.asset(
                AppIcons.dropdown,
                width: SizeConfig.md,
                color: AppColor.dark,
              ),
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: AppColor.dark),
      elevation: 0,
      backgroundColor: AppColor.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.getAppBarHeight());
}
