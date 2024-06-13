import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../controllers/user_controller.dart';

class SideCard extends StatelessWidget {
  const SideCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final theme = Theme.of(context).textTheme;
    return ListView(
      children: [
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
          CardProfile(controller: controller, theme: theme)
        else
          CardProfile(controller: controller, theme: theme),
        PersonalInformation(theme: theme),
      ],
    );
  }
}

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
    required this.controller,
    required this.theme,
  });

  final UserController controller;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: CenterMenuWidget(
          isCenter: !ResponsiveWidget.isSmallScreen(context),
          child: Column(
            children: [
              Obx(() {
                final networkImg = controller.user.value.profilePicture;
                final img =
                    networkImg.isNotEmpty ? networkImg : AppIcons.noImage;
                return controller.imageUploading.value
                    ? const ShimmerEffect(width: 85, height: 85, radius: 85)
                    : CircuralImage(
                        img: img,
                        height: 85,
                        width: 85,
                        padding: 0,
                        isNetworkImg: networkImg.isNotEmpty,
                      );
              }),
              Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(height: 20),
                      controller.imageUploading.value
                          ? const ShimmerEffect(width: 65, height: 22)
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(controller.company.value.name,
                                      style: theme.titleMedium!.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              Text('Personal Information',
                  style:
                      theme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Text('Anda belum menulis singkat tentang deskripsi anda',
              style: theme.labelMedium),
        ],
      ),
    );
  }
}
