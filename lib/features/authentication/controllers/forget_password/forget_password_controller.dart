import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  // Variables
  final hidePassword = true.obs;
  final password = TextEditingController();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
}
