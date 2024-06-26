import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonFocusScope(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CenterMenuWidget(
          isCenter: !ResponsiveWidget.isSmallScreen(context),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              constraints: BoxConstraints(
                  maxWidth: ResponsiveWidget.isSmallScreen(context)
                      ? double.infinity
                      : 550),
              child: const LoginForm(),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationAuth(
          title: Dictionary.dontHaveAccount,
          subTitle: Dictionary.signup,
          onTap: () => HelperFunction.navigatePushToNamed(authSignUpRoute),
        ),
      ),
    );
  }
}
