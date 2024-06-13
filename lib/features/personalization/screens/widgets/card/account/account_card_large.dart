import 'package:flutter/material.dart';
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
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  @override
  void initState() {
    name.text = controller.user.value.fullName;
    email.text = controller.user.value.email;
    bio.text = controller.user.value.bioData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderCard(
      label: Dictionary.account,
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
                      CustomLayoutTextFormField(
                        title: Dictionary.name,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: name,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.name, value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.email,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: email,
                          readOnly: true,
                          textInputType: TextInputType.emailAddress,
                          validate: (value) => Validator.validateEmail(value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.bio,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          maxLines: 3,
                          maxLength: 150,
                          controller: bio,
                          isDense: true,
                          textInputType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: SizeConfig.spaceBtwInputFiels),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.grey, width: 1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () {
                            final networkImg =
                                controller.user.value.profilePicture;
                            final img = networkImg.isNotEmpty
                                ? networkImg
                                : AppIcons.noImage;
                            return controller.imageUploading.value
                                ? const ShimmerEffect(width: 120, height: 120)
                                : CircuralImage(
                                    img: img,
                                    height: 120,
                                    width: 120,
                                    padding: 0,
                                    isNetworkImg: networkImg.isNotEmpty,
                                  );
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                final profileName =
                                    controller.user.value.profileName;
                                final nme = profileName.isNotEmpty
                                    ? profileName
                                    : 'Pilih foto versi terbaikmu';
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    controller.imageUploading.value
                                        ? const ShimmerEffect(
                                            width: 65, height: 22)
                                        : Text(nme),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              }),
                              ButtonPrimary(
                                  title: Dictionary.updateImage,
                                  isCustom: false,
                                  onTap: () =>
                                      controller.uploadUserProfilePicture())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            ButtonPrimary(
              title: Dictionary.update,
              isCustom: false,
              onTap: () => controller.addOrUpdateAccount(
                  name: name.text.trim(), bio: bio.text.trim()),
            ),
          ],
        ),
      ),
    );
  }
}
