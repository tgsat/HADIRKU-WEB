import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  senPasswordResetEmail() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!forgetFormKey.currentState!.validate()) {
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      Loaders.successSnackBar(
          title: Dictionary.emailSent, message: Dictionary.emailSentDes.tr);

      email.clear();
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    }
  }
}
