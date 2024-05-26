import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonFocusScope(
      child: Scaffold(
        body: CenterMenuWidget(
          isCenter: !ResponsiveWidget.isSmallScreen(context),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              constraints: BoxConstraints(
                  maxWidth:
                      !ResponsiveWidget.isSmallScreen(context) ? 550 : 400),
              child: const SignUpForm(),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationAuth(
            title: Dictionary.alreadyHaveAccount,
            subTitle: Dictionary.login,
            onTap: () => Get.offAllNamed(authenticationRoute)),
      ),
    );
  }
}
