import 'package:flutter/material.dart';
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
          CustomTextFormField(
            title: Dictionary.companyName,
            isLabel: true,
            controller: controller.company,
            validate: (value) =>
                Validator.validateEmptyText(Dictionary.companyName, value),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomTextFormField(
            title: Dictionary.fullName,
            isLabel: true,
            controller: controller.name,
            validate: (value) =>
                Validator.validateEmptyText(Dictionary.fullName, value),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomTextFormField(
            title: Dictionary.email,
            isLabel: true,
            controller: controller.email,
            textInputType: TextInputType.emailAddress,
            validate: (value) => Validator.validateEmail(value),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomTextFormField(
            title: Dictionary.noHP,
            isLabel: true,
            controller: controller.phone,
            textInputType: TextInputType.phone,
            validate: (value) =>
                Validator.validatePhoneNumber(Dictionary.noHP, value),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          CustomTextFormField(
            title: Dictionary.city,
            isLabel: true,
            controller: controller.city,
            textInputType: TextInputType.streetAddress,
            validate: (value) =>
                Validator.validateEmptyText(Dictionary.city, value),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          Obx(
            () => CustomTextFormField(
              title: Dictionary.password,
              isLabel: true,
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
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          Obx(
            () => CustomTextFormField(
              title: Dictionary.passwordConfirm,
              isLabel: true,
              controller: controller.passwordConfirm,
              isObscure: controller.hidePasswordConfirm.value,
              validate: (value) => Validator.validatePasswordConfirm(
                  Dictionary.passwordConfirm, value, controller.password.text),
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
          const SizedBox(height: 15),
          ButtonPrimary(
            title: Dictionary.signup,
            onTap: () {
              if (controller.signUpFormKey.currentState!.validate()) {
                Get.offAllNamed(initialRoute);
              }
            },
          ),
        ],
      ),
    );
  }
}
