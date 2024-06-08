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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          final networkImg = controller.user.value.profilePicture;
          final img = networkImg.isNotEmpty ? networkImg : AppIcons.noImage;
          return controller.imageUploading.value
              ? const ShimmerEffect(width: 42, height: 42, radius: 42)
              : CircuralImage(
                  img: img,
                  height: 42,
                  width: 42,
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.imageUploading.value
                          ? const ShimmerEffect(width: 65, height: 22)
                          : Text(controller.user.value.fullName,
                              style: theme.titleMedium!
                                  .apply(color: AppColor.dark)),
                      controller.imageUploading.value
                          ? const ShimmerEffect(width: 50, height: 15)
                          : Text(controller.user.value.roles ?? '',
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
