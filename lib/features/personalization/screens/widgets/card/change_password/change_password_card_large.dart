import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../controllers/user_controller.dart';
import '../profile_header_card.dart';

class ChangePasswordCardLarge extends StatefulWidget {
  const ChangePasswordCardLarge({super.key});

  @override
  State<ChangePasswordCardLarge> createState() =>
      _ChangePasswordCardLargeState();
}

class _ChangePasswordCardLargeState extends State<ChangePasswordCardLarge> {
  final controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderCard(
      button: ButtonAdittional(
        title: Dictionary.save,
        onTap: () => controller.reAuthChangePasswordUser(),
      ),
      label: Dictionary.updatePassword,
      child: Form(
        key: controller.changePasswordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CustomLayoutTextFormField(
                title: "${Dictionary.password} Lama",
                isScreen: true,
                rightFlex: 5,
                child: CustomTextFormField(
                  title: Dictionary.password,
                  controller: controller.oldPassword,
                  isObscure: controller.hideOldPassword.value,
                  validate: (value) =>
                      Validator.validatePassword(Dictionary.password, value),
                  suffixIconWidget: IconButton(
                    onPressed: () => controller.hideOldPassword.value =
                        !controller.hideOldPassword.value,
                    icon: SvgPicture.asset(
                        controller.hideOldPassword.value
                            ? AppIcons.eyeHide
                            : AppIcons.eyeShow,
                        color: AppColor.darkGrey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => CustomLayoutTextFormField(
                title: "${Dictionary.password} Baru",
                isScreen: true,
                rightFlex: 5,
                child: CustomTextFormField(
                  title: Dictionary.password,
                  controller: controller.verifyPassword,
                  isObscure: controller.hidePassword.value,
                  validate: (value) => Validator.validatePasswordOld(
                      "${Dictionary.password} Baru",
                      value,
                      controller.oldPassword.text),
                  suffixIconWidget: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: SvgPicture.asset(
                        controller.hidePassword.value
                            ? AppIcons.eyeHide
                            : AppIcons.eyeShow,
                        color: AppColor.darkGrey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => CustomLayoutTextFormField(
                title: "Ulang ${Dictionary.password} Baru",
                isScreen: true,
                rightFlex: 5,
                child: CustomTextFormField(
                  title: "Ulang ${Dictionary.password}",
                  controller: controller.verifyPasswordConfirm,
                  isObscure: controller.hideConfirmPassword.value,
                  validate: (value) => Validator.validatePasswordConfirm(
                      "Ulang ${Dictionary.password}",
                      value,
                      controller.verifyPassword.text),
                  suffixIconWidget: IconButton(
                    onPressed: () => controller.hideConfirmPassword.value =
                        !controller.hideConfirmPassword.value,
                    icon: SvgPicture.asset(
                        controller.hideConfirmPassword.value
                            ? AppIcons.eyeHide
                            : AppIcons.eyeShow,
                        color: AppColor.darkGrey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
