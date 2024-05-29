import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/personalization/user_repository.dart';
import '../../../../models/personalization/user_model.dart';

class SignUpController extends GetxController {
  // Variables
  final hidePassword = true.obs;
  final hidePasswordConfirm = true.obs;
  final company = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      if (!signUpFormKey.currentState!.validate()) return;

      final userCredention = await AuthenticationRepository.instance
          .registerEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = UserModel(
        id: userCredention.user!.uid,
        companyName: company.text.trim(),
        fullName: name.text.trim(),
        city: city.text.trim(),
        email: email.text.trim(),
        phoneNumber: phone.text.trim(),
        profilePicture: '',
        bioData: '',
        gender: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      Loaders.successSnackBar(
          title: Dictionary.congratulations,
          message: Dictionary.congratulationsDes);

      // Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      Get.offAllNamed(dashboardRoute);
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    }
  }
}
