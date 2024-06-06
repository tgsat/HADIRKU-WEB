import 'package:flutter/material.dart';
import 'package:hadirku_web/features/authentication/screens/forget_password/widgets/forget_password_form.dart';
import 'package:hadirku_web/utils/utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonFocusScope(
      child: Scaffold(
        body: CenterMenuWidget(
            isCenter: !ResponsiveWidget.isSmallScreen(context),
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                constraints: BoxConstraints(
                    maxWidth: ResponsiveWidget.isSmallScreen(context)
                        ? double.infinity
                        : 550),
                child: const ForgetPasswordForm(),
              ),
            )),
      ),
    );
  }
}
