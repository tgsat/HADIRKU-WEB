import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonFocusScope(
      child: Scaffold(
        body: CenterMenuWidget(
          isCenter: !ResponsiveWidget.isSmallScreen(context),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              constraints: BoxConstraints(
                  maxWidth: !ResponsiveWidget.isMediumScreen(context)
                      ? ResponsiveWidget.isSmallScreen(context)
                          ? double.infinity
                          : 550
                      : 400),
              child: const LoginForm(),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationAuth(
          title: Dictionary.dontHaveAccount,
          subTitle: Dictionary.signup,
          onTap: () => Get.toNamed(authSignUpRoute),
        ),
      ),
    );
  }
}
