import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../controllers/login/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final theme = Theme.of(context).textTheme;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Image(
                  width: 150,
                  image: AssetImage(AppIcons.logo),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          const SizedBox(height: 10),
          const TextHeaderAuth(title: Dictionary.login),
          const SizedBox(height: 10),
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
          Obx(
            () => CustomLayoutTextFormField(
              title: Dictionary.password,
              isScreen: !ResponsiveWidget.isSmallScreen(context),
              child: CustomTextFormField(
                controller: controller.password,
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text(
                      Dictionary.rememberMe,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.labelMedium,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(authForgetPasswordRoute),
                child: Text(
                  "${Dictionary.forgetPassword}?",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium!.apply(color: AppColor.active),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          ButtonPrimary(
              title: Dictionary.login,
              onTap: () {
                if (controller.loginFormKey.currentState!.validate()) {
                  Get.offAllNamed(dashboardRoute);
                }
                // Get.offAllNamed(initialRoute);
              }),
        ],
      ),
    );
  }
}
