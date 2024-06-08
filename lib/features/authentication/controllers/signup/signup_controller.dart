import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/personalization/models/company_model.dart';
import 'package:hadirku_web/features/personalization/models/roles_model.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/personalization/user_repository.dart';
import '../../../personalization/models/user_model.dart';

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
  final authRepository = Get.put(AuthenticationRepository());
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  var uniqueKey = DateTime.now().millisecondsSinceEpoch.toString();

  void signup() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      if (!signUpFormKey.currentState!.validate()) return;

      final userCredention = await AuthenticationRepository.instance
          .registerEmailAndPassword(email.text.trim(), password.text.trim());

      final companyS = CompanyModel(
          id: userCredention.user!.uid,
          name: company.text.trim(),
          createAt: DateTime.now());

      final rolesS = RolesModel(
        id: uniqueKey,
        roles: 'Administrasi',
        createAt: DateTime.now(),
      );

      final newUser = UserModel(
        id: userCredention.user!.uid,
        companyName: companyS.id,
        fullName: name.text.trim(),
        city: city.text.trim(),
        roles: rolesS.roles,
        email: email.text.trim(),
        phoneNumber: phone.text.trim(),
        profilePicture: '',
        bioData: '',
      );

      await userRepository.saveUserRecord(newUser);
      await authRepository.saveCompanyRecord(companyS);
      await authRepository.saveRolesRecord(rolesS);

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
