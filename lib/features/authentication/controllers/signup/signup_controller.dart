import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
