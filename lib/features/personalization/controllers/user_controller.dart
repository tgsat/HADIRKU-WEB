import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/personalization/user_repository.dart';
import '../models/company_model.dart';
import '../models/roles_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  Rx<CompanyModel> company = CompanyModel.empty().obs;
  RxList<RolesModel> allRole = <RolesModel>[].obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final authRepository = Get.put(AuthenticationRepository());
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    fetchUserCompanyRecord();
    fetchUserRolesRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> fetchUserCompanyRecord() async {
    try {
      final companyS = await userRepository.fetchUserCompany();
      company(companyS);
    } catch (e) {
      company(CompanyModel.empty());
    }
  }

  Future<void> fetchUserRolesRecord() async {
    try {
      final roles = await userRepository.fetchUserRoles();
      allRole.assignAll(roles);
    } catch (e) {
      RolesModel.empty();
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First update rx user and then check if user data already stored. If new store new data
      await fetchUserRecord();

      // if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // map data
          final user = UserModel(
              id: userCredential.user!.uid,
              companyName: '',
              fullName: '',
              city: '',
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '',
              bioData: '');

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: Dictionary.dataNotSave, message: Dictionary.dataNotSaveDes);
    }
  }

  // Delete account warning
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SizeConfig.md),
        title: Dictionary.deleteAccount,
        middleText: Dictionary.deleteDescription,
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.lg),
                child: Text(Dictionary.delete))),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                side: const BorderSide(color: Colors.blueGrey)),
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text(Dictionary.cancel)));
  }

  void deleteUserAccount() async {
    try {
      final auth = AuthenticationRepository.instance;
      final providers =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      debugPrint('providers: $providers');
      // print('providers: $providers');
      if (providers.isNotEmpty) {
        if (providers == 'google.com') {
          await auth.deleteAccount();
          Get.offAllNamed(authSignInRoute);
        } else if (providers == 'password') {
          // Get.to(() => const ReAuthLoginForm());
          Get.to(() => Container());
        }
      }
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    }
  }

  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form Validation
      if (!reAuthFromKey.currentState!.validate()) {
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      Get.offAllNamed(authSignInRoute);
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 500,
        maxWidth: 500,
        imageQuality: 70,
      );

      if (image != null) {
        imageUploading.value = true;
        // Upload image
        // final imageUrl = await userRepository.uploadImage(
        //     'Users/Images/Profile/${AuthenticationRepository.instance.authUser?.uid}/',
        //     image);

        final imageUrl = await userRepository.uploadUserImage(
            image, AuthenticationRepository.instance.authUser?.uid ?? '');

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        Loaders.successSnackBar(
            title: Dictionary.congratulations,
            message: Dictionary.yourProfileImgUpdate);
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: Dictionary.oops, message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }

  logoutAccountWarningPopUp(Function() onTap) {
    final theme = Theme.of(Get.context!).textTheme;
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SizeConfig.md),
        title: Dictionary.logout,
        titleStyle: theme.headlineSmall,
        middleText: Dictionary.logoutDescription,
        middleTextStyle: theme.titleMedium,
        confirm: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeConfig.lg),
                child: Text(Dictionary.logout,
                    style: theme.titleMedium!.apply(color: Colors.white)))),
        cancel: ElevatedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: const BorderSide(color: Colors.black87)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeConfig.lg),
              child: Text(Dictionary.cancel,
                  style: theme.titleMedium!.apply(color: Colors.black87)),
            )));
  }
}
