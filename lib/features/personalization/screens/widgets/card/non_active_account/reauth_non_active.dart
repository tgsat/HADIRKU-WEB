import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../controllers/user_controller.dart';

class ReauthNonActiveAccountCardLarge extends StatelessWidget {
  const ReauthNonActiveAccountCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Form(
      key: controller.reAuthFromKey,
      child: Container(
        padding: const EdgeInsets.all(SizeConfig.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        constraints: BoxConstraints(
            maxWidth:
                ResponsiveWidget.isSmallScreen(context) ? double.infinity : 550,
            maxHeight: ResponsiveWidget.isSmallScreen(context)
                ? double.infinity
                : 550),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Dictionary.reauthNonActiveAccount,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: SizeConfig.spaceBtwInputFiels),
              CustomLayoutTextFormField(
                title: Dictionary.email,
                isScreen: !ResponsiveWidget.isSmallScreen(context),
                child: CustomTextFormField(
                  controller: controller.verifyEmail,
                  textInputType: TextInputType.emailAddress,
                  validate: (value) => Validator.validateEmail(value),
                ),
              ),
              const SizedBox(height: SizeConfig.spaceBtwInputFiels),
              Obx(
                () => CustomLayoutTextFormField(
                  title: Dictionary.password,
                  isScreen: !ResponsiveWidget.isSmallScreen(context),
                  child: CustomTextFormField(
                    controller: controller.verifyPassword,
                    isObscure: controller.hidePassword.value,
                    validate: (value) =>
                        Validator.validateEmptyText(Dictionary.password, value),
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
              const SizedBox(height: 15),
              Row(
                children: [
                  ButtonAdittional(
                      title: Dictionary.delete,
                      onTap: () => controller.reAuthEmailAndPasswordUser()),
                  Expanded(child: Container()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
