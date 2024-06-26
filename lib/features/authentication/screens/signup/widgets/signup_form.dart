import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../controllers/signup/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextHeaderAuth(
              title: Dictionary.signupTitle,
              subTitle: Dictionary.signupSubTitle),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomLayoutTextFormField(
            title: Dictionary.fullName,
            isScreen: !ResponsiveWidget.isSmallScreen(context),
            child: CustomTextFormField(
              controller: controller.name,
              validate: (value) =>
                  Validator.validateEmptyText(Dictionary.fullName, value),
            ),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomLayoutTextFormField(
            title: Dictionary.email,
            isScreen: !ResponsiveWidget.isSmallScreen(context),
            child: CustomTextFormField(
              controller: controller.email,
              textInputType: TextInputType.emailAddress,
              validate: (value) => Validator.validateEmail(value),
            ),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomLayoutTextFormField(
            title: Dictionary.noHP,
            isScreen: !ResponsiveWidget.isSmallScreen(context),
            child: CustomTextFormField(
              controller: controller.phone,
              textInputType: TextInputType.number,
              validate: (value) =>
                  Validator.validatePhoneNumber(Dictionary.noHP, value),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomLayoutTextFormField(
            title: Dictionary.city,
            isScreen: !ResponsiveWidget.isSmallScreen(context),
            child: CustomTextFormField(
              controller: controller.city,
              textInputType: TextInputType.streetAddress,
              validate: (value) =>
                  Validator.validateEmptyText(Dictionary.city, value),
            ),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          Obx(
            () => CustomLayoutTextFormField(
              title: Dictionary.password,
              isScreen: !ResponsiveWidget.isSmallScreen(context),
              child: CustomTextFormField(
                controller: controller.password,
                isObscure: controller.hidePassword.value,
                validate: (value) =>
                    Validator.validatePassword(Dictionary.password, value),
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
              title: Dictionary.passwordConfirm,
              isScreen: !ResponsiveWidget.isSmallScreen(context),
              child: CustomTextFormField(
                controller: controller.passwordConfirm,
                isObscure: controller.hidePasswordConfirm.value,
                validate: (value) => Validator.validatePasswordConfirm(
                    Dictionary.passwordConfirm,
                    value,
                    controller.password.text),
                suffixIconWidget: IconButton(
                  onPressed: () => controller.hidePasswordConfirm.value =
                      !controller.hidePasswordConfirm.value,
                  icon: SvgPicture.asset(
                      controller.hidePasswordConfirm.value
                          ? AppIcons.eyeHide
                          : AppIcons.eyeShow,
                      color: AppColor.darkGrey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ButtonPrimary(
            title: Dictionary.signup,
            onTap: () => controller.signup(),
          ),
          const SizedBox(height: SizeConfig.md),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.darkGrey),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppIcons.info,
                    width: SizeConfig.dl,
                    height: SizeConfig.dl,
                    color: AppColor.darkGrey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(Dictionary.signupInfo,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColor.darkGrey, height: 1.2)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
