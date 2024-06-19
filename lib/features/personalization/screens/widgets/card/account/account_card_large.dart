import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/profile_header_card.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../controllers/user_controller.dart';

class AccountCardLarge extends StatefulWidget {
  const AccountCardLarge({super.key});

  @override
  State<AccountCardLarge> createState() => _AccountCardLargeState();
}

class _AccountCardLargeState extends State<AccountCardLarge> {
  final controller = UserController.instance;
  final uid = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  @override
  void initState() {
    uid.text = controller.user.value.id;
    name.text = controller.user.value.fullName;
    email.text = controller.user.value.email;
    bio.text = controller.user.value.bioData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderCard(
      label: Dictionary.account,
      button: ButtonAdittional(
        title: Dictionary.save,
        onTap: () => controller.addOrUpdateAccount(
            name: name.text.trim(), bio: bio.text.trim()),
      ),
      child: Form(
        key: controller.accountKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: !ResponsiveWidget.isLargeScreen(context),
                        child: Column(
                          children: [
                            ChangeImage(controller: controller),
                            const SizedBox(
                                height: SizeConfig.spaceBtwInputFiels),
                          ],
                        ),
                      ),
                      Obx(
                        () => CustomLayoutTextFormField(
                          title: Dictionary.id,
                          isScreen: true,
                          rightFlex: 5,
                          child: controller.profileLoading.value
                              ? const NormalShimmerEffect()
                              : CustomTextFormField(
                                  controller: uid,
                                  readOnly: true,
                                ),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      Obx(
                        () => CustomLayoutTextFormField(
                          title: Dictionary.email,
                          isScreen: true,
                          rightFlex: 5,
                          child: controller.profileLoading.value
                              ? const NormalShimmerEffect()
                              : CustomTextFormField(
                                  controller: email,
                                  readOnly: true,
                                  textInputType: TextInputType.emailAddress,
                                  validate: (value) =>
                                      Validator.validateEmail(value),
                                ),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      Obx(
                        () => CustomLayoutTextFormField(
                          title: Dictionary.name,
                          isScreen: true,
                          rightFlex: 5,
                          child: controller.profileLoading.value
                              ? const NormalShimmerEffect()
                              : CustomTextFormField(
                                  controller: name,
                                  validate: (value) =>
                                      Validator.validateEmptyText(
                                          Dictionary.name, value),
                                ),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      Obx(
                        () => CustomLayoutTextFormField(
                          title: Dictionary.bio,
                          isScreen: true,
                          rightFlex: 5,
                          child: controller.profileLoading.value
                              ? const NormalShimmerEffect(normal: false)
                              : CustomTextFormField(
                                  controller: bio,
                                  isLines: true,
                                  textInputType: TextInputType.multiline,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(150),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !ResponsiveWidget.isMediumScreen(context),
                  child: Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: SizeConfig.spaceBtwInputFiels),
                    child: ChangeImage(controller: controller),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeImage extends StatelessWidget {
  const ChangeImage({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    double imageSize = SizeConfig.imageLarge;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.grey, width: 1)),
      child: ResponsiveLayoutWidget.axis(
        children: [
          Obx(
            () {
              final networkImg = controller.user.value.profilePicture;
              final fullName = controller.user.value.fullName;

              final img = networkImg.isNotEmpty ? networkImg : fullName;
              return controller.imageUploading.value
                  ? ShimmerEffect(
                      width: imageSize, height: imageSize, radius: 15)
                  : CircuralImage(
                      img: img,
                      title: img,
                      height: imageSize,
                      width: imageSize,
                      padding: 0,
                      radius: 15,
                      isCustom: true,
                      isNetworkImg: networkImg.isNotEmpty,
                      backgroundColor: AppColor.disable.withOpacity(0.8),
                    );
            },
          ),
          ResponsiveLayoutWidget.space(10),
          ResponsiveLayoutWidget.expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  final profileName = controller.user.value.profileName;
                  final nme = profileName.isNotEmpty
                      ? profileName
                      : 'Format Support: JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, and WBMP.';
                  return controller.imageUploading.value
                      ? const ShimmerEffect(width: 65, height: 22)
                      : Text(nme,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: Colors.black));
                }),
                const SizedBox(height: 6),
                Obx(() {
                  final networkImg = controller.user.value.profilePicture;
                  final txt = networkImg.isNotEmpty
                      ? 'Hapus Foto'
                      : Dictionary.updateImage;
                  final svg = networkImg.isNotEmpty
                      ? AppIcons.trash
                      : AppIcons.userEdit;
                  final colors = networkImg.isNotEmpty
                      ? AppColor.darkGrey
                      : AppColor.active;
                  final onTaps = networkImg.isNotEmpty
                      ? () => controller.removeUserProfilePicture()
                      : () => controller.uploadUserProfilePicture();
                  return controller.imageUploading.value
                      ? const ShimmerEffect(width: 80, height: 30, radius: 8)
                      : IconTextButton(
                          onTap: onTaps,
                          title: txt,
                          svg: svg,
                          colors: colors,
                        );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String title, svg;
  final Color colors;
  final Function() onTap;
  const IconTextButton(
      {super.key,
      required this.title,
      required this.svg,
      required this.colors,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ButtonOpacity(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svg, width: 16, color: colors),
          const SizedBox(width: 6),
          Text(
            title,
            style:
                Theme.of(context).textTheme.labelMedium!.apply(color: colors),
          ),
        ],
      ),
    );
  }
}
