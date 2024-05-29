import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  // final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    loadPreference();
    super.onInit();
  }

  /// [LoadSharedPreferenceData]
  loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    email.text = prefs.getString('REMEMBER_ME_EMAIL') ?? '';
    password.text = prefs.getString('REMEMBER_ME_PASSWORD') ?? '';
    rememberMe.value = prefs.getBool('REMEMBER_ME') ?? false;
  }

  /// [Signin] Email & Password
  Future<void> emailAndPasswordSignin() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      if (rememberMe.value) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('REMEMBER_ME_EMAIL', email.text);
        prefs.setString('REMEMBER_ME_PASSWORD', password.text);
      }

      await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    }
  }
}
