import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/personalization/models/profile_model.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/non_active_account/reauth_non_active.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/personalization/user_repository.dart';
import '../models/roles_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final hidePassword = true.obs;
  final hideOldPassword = true.obs;
  final hideConfirmPassword = true.obs;
  final imageUploading = false.obs;
  final profileLoading = false.obs;

  RxInt selectedGender = 0.obs;
  RxInt selectedStatus = 0.obs;
  RxInt selectedReligius = 0.obs;
  RxInt selectedGolda = 0.obs;
  String fileName = '';
  Uint8List? fileBytes;

  Rx<UserModel> user = UserModel.empty().obs;
  Rx<ProfileModel> profile = ProfileModel.empty().obs;
  RxList<RolesModel> allRole = <RolesModel>[].obs;

  final verifyEmail = TextEditingController();
  final oldPassword = TextEditingController();
  final verifyPassword = TextEditingController();
  final verifyPasswordConfirm = TextEditingController();

  final noKTPCont = TextEditingController();
  final noKKCont = TextEditingController();
  final addressCont = TextEditingController();
  final addressFullCont = TextEditingController();
  final heightCont = TextEditingController();
  final weightCont = TextEditingController();

  final fbCont = TextEditingController();
  final xCont = TextEditingController();
  final igCont = TextEditingController();
  final inCont = TextEditingController();
  final waCont = TextEditingController();

  final userRepository = Get.put(UserRepository());
  final authRepository = Get.put(AuthenticationRepository());

  GlobalKey<FormState> accountKey = GlobalKey<FormState>();
  GlobalKey<FormState> editProfileKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    fetchUserRolesRecord();
  }

  Future<void> addOrUpdateAccount(
      {required String name, required String bio}) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!accountKey.currentState!.validate()) {
        return;
      }
      profileLoading.value = true;

      var isAccount = {
        'FullName': name,
        'Bio': bio,
      };
      await userRepository.updateSingleField(isAccount);

      user.value.fullName = name;
      user.value.bioData = bio;
      user.refresh();
    } catch (e) {
      Loaders.errorSnackBar(
          title: Dictionary.oops,
          message: '${Dictionary.cannotUpdate} Akun, ${e.toString()}');
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> addOrUpdateProfile() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!editProfileKey.currentState!.validate()) {
        return;
      }

      final profile = ProfileModel(
          id: authRepository.uniqueId,
          ktp: noKTPCont.text.trim(),
          kk: noKKCont.text.trim(),
          gender: selectedGender.value,
          status: selectedStatus.value,
          religius: selectedReligius.value,
          golda: selectedGolda.value,
          updateAt: DateTime.now());
      await userRepository.updateChildSingleField('Profile', profile.toJson());

      Loaders.successSnackBar(
          title: Dictionary.congratulations,
          message: Dictionary.profileDescription);

      // Get.off(() => const ProfileScreen());
    } catch (e) {
      Loaders.errorSnackBar(
          title: Dictionary.oops,
          message: '${Dictionary.cannotUpdate} Edit Profile, ${e.toString()}');
    }
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
      await fetchUserRolesRecord();

      // if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // map data
          final user = UserModel(
              id: userCredential.user!.uid,
              fullName: '',
              city: '',
              roles: 1.toString(),
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '',
              profileName: '',
              profileID: '',
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
            onPressed: () async {
              Navigator.of(Get.overlayContext!).pop();
              deleteUserAccount();
            },
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
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.lg),
                child: Text(Dictionary.cancel))));
  }

  deleteUserAccount() async {
    try {
      final auth = AuthenticationRepository.instance;
      final providers =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (providers.isNotEmpty) {
        if (providers == 'google.com') {
          await auth.deleteAccount();
          Get.offAll(authSignInRoute);
        } else if (providers == 'password') {
          HelperFunction.showAlertForm(
              isTransparant: true,
              child: const ReauthNonActiveAccountCardLarge());
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

  Future<void> reAuthChangePasswordUser() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!changePasswordKey.currentState!.validate()) {
        return;
      }
      profileLoading.value = true;

      final usr = AuthenticationRepository.instance;

      await usr.reAuthWithEmailAndPassword(
          usr.authUser!.email!, oldPassword.text.trim());

      await usr.changePassword(verifyPassword.text.trim());

      user.refresh();

      oldPassword.clear();
      verifyPassword.clear();
      verifyPasswordConfirm.clear();

      Loaders.successSnackBar(
          title: Dictionary.congratulations,
          message: "${Dictionary.updatePassword} anda berhasil");
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  uploadUserProfilePicture() async {
    try {
      final userID = AuthenticationRepository.instance.authUser?.uid ?? '';
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        imageUploading.value = true;
        fileBytes = result.files.first.bytes;
        fileName = result.files.first.name;

        final fileUrl =
            await userRepository.uploadUserImage(fileBytes!, userID);

        Map<String, dynamic> json = {
          'ProfilePicture': fileUrl,
          'ProfileID': userID,
          'ProfileName': fileName,
        };
        await userRepository.updateSingleField(json);

        user.value.profilePicture = fileUrl;
        user.value.profileName = fileName;
        user.value.profileID = userID;

        user.refresh();
      }
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  removeUserProfilePicture() async {
    try {
      imageUploading.value = true;
      final userID = AuthenticationRepository.instance.authUser?.uid ?? '';
      Map<String, dynamic> json = {
        'ProfilePicture': '',
        'ProfileID': '',
        'ProfileName': '',
      };
      await userRepository.updateSingleField(json);
      await userRepository.removeUserImage(userID);

      user.value.profilePicture = '';
      user.value.profileID = '';
      user.value.profileName = '';

      user.refresh();
    } catch (e) {
      Loaders.errorSnackBar(title: Dictionary.oops, message: e.toString());
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
