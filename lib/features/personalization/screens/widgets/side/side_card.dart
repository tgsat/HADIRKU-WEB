import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        PersonalInformation(theme: theme, controller: controller),
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
    double imageSize = SizeConfig.imageMedium;
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
                final fullName = controller.user.value.fullName;

                final img = networkImg.isNotEmpty ? networkImg : fullName;
                return controller.imageUploading.value
                    ? ShimmerEffect(width: imageSize, height: imageSize)
                    : CircuralImage(
                        img: img,
                        title: img,
                        height: imageSize,
                        width: imageSize,
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
                          : Text(controller.user.value.roles,
                              style: theme.labelMedium!
                                  .copyWith(color: AppColor.dark, height: 1.2)),
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
    required this.controller,
  });

  final TextTheme theme;
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Personal Information',
                  style:
                      theme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () {
              final val = controller.user.value;
              return controller.imageUploading.value
                  ? const ShimmerEffect(width: 80, height: 15)
                  : Text(
                      val.bioData.isEmpty
                          ? 'Anda belum menulis singkat tentang deskripsi anda'
                          : val.bioData,
                      style: theme.labelMedium);
            },
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              sosmed('', type: Dictionary.facebook),
              sosmed('', type: Dictionary.tweets),
              sosmed('', type: Dictionary.instagram),
              sosmed('', type: Dictionary.linkedin),
              sosmed('', type: Dictionary.website),
            ],
          )
        ],
      ),
    );
  }

  Widget sosmed(String url, {required String type}) {
    switch (type) {
      case Dictionary.facebook:
        return sosmedIcon(AppIcons.facebook, AppColor.facebookGradient, url);
      case Dictionary.tweets:
        return sosmedIcon(AppIcons.tweets, AppColor.twitterGradient, url);
      case Dictionary.instagram:
        return sosmedIcon(AppIcons.instagram, AppColor.instagramGradient, url);
      case Dictionary.linkedin:
        return sosmedIcon(AppIcons.linkedin, AppColor.linkedinGradient, url);
      case Dictionary.website:
        return sosmedIcon(AppIcons.website, AppColor.websiteGradient, url);
      default:
        return sosmedIcon(AppIcons.facebook, AppColor.facebookGradient, url);
    }
  }

  Widget sosmedIcon(String svg, Gradient gradient, String url) {
    return InkWell(
      onTap: () => js.context.callMethod('open', [url]),
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: SvgPicture.asset(svg,
              width: SizeConfig.dl, color: AppColor.white),
        ),
      ),
    );
  }
}
