import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:hadirku_web/utils/utils.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Form(
      key: controller.forgetFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextHeaderAuth(
              title: Dictionary.forgetPassword,
              subTitle: Dictionary.forgetPasswordSubTitle),
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
          const SizedBox(height: 15),
          ButtonPrimary(
            title: Dictionary.submit,
            onTap: () {
              if (controller.forgetFormKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
