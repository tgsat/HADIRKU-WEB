import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class TopNavigatorMenu extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> keys;
  const TopNavigatorMenu({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Image(
                    image: AssetImage(AppIcons.mainLogo),
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                keys.currentState?.openDrawer();
              }),
      title: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: Text(Dictionary.appName.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 20,
                      color: AppColor.active,
                      fontWeight: FontWeight.bold))),
          Expanded(child: Container()),
          Stack(
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    AppIcons.notification,
                    width: SizeConfig.dl,
                    color: AppColor.light,
                  ),
                  onPressed: () {}),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColor.active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.light, width: 2)),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            AppIcons.user,
            width: SizeConfig.dl,
            color: AppColor.light,
          ),
          Visibility(
            visible: !ResponsiveWidget.isSmallScreen(context),
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                Text("Tahu Bulat",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColor.light)),
              ],
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: AppColor.light),
      elevation: 0,
      backgroundColor: AppColor.secondary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.getAppBarHeight());
}
