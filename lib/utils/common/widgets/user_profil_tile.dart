import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../features/personalization/controllers/user_controller.dart';

class UserProfileTile extends StatelessWidget {
  final Widget child;
  const UserProfileTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final theme = Theme.of(context).textTheme;
    double imageSize = SizeConfig.imageSmall;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          final val = controller.user.value;

          final networkImg = val.profilePicture;
          final fullName = val.fullName;
          final role = val.roles;

          final img = networkImg.isNotEmpty ? networkImg : fullName;
          return controller.imageUploading.value
              ? ShimmerEffect(width: imageSize, height: imageSize)
              : ResponsiveWidget.isSmallScreen(context)
                  ? ImageTooltip(
                      message: role.isEmpty ? fullName : '$fullName\n$role',
                      child: CircuralImage(
                        img: img,
                        title: img,
                        height: imageSize,
                        width: imageSize,
                        padding: 0,
                        isNetworkImg: networkImg.isNotEmpty,
                      ))
                  : CircuralImage(
                      img: img,
                      title: img,
                      height: imageSize,
                      width: imageSize,
                      padding: 0,
                      isNetworkImg: networkImg.isNotEmpty,
                    );
        }),
        Visibility(
          visible: !ResponsiveWidget.isSmallScreen(context),
          child: Row(
            children: [
              const SizedBox(width: 6),
              Obx(
                () {
                  final val = controller.user.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.imageUploading.value
                          ? const ShimmerEffect(width: 65, height: 22)
                          : Text(val.fullName,
                              style: theme.titleMedium!
                                  .apply(color: AppColor.dark)),
                      controller.imageUploading.value
                          ? const ShimmerEffect(width: 50, height: 15)
                          : Text(val.roles,
                              style: theme.labelMedium!
                                  .copyWith(color: AppColor.dark, height: 1.2)),
                    ],
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
