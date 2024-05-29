import 'package:flutter/material.dart';
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
          CustomLayoutTextFormField(
            title: Dictionary.email,
            isScreen: !ResponsiveWidget.isSmallScreen(context),
            child: CustomTextFormField(
              controller: controller.email,
              textInputType: TextInputType.emailAddress,
              validate: (value) => Validator.validateEmail(value),
            ),
          ),
          const SizedBox(height: 15),
          ButtonPrimary(
            title: Dictionary.submit,
            onTap: () => controller.senPasswordResetEmail(),
          ),
        ],
      ),
    );
  }
}
