import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/data/endpoint/endpoint.dart';
import 'package:hadirku_web/features/personalization/models/company_model.dart';
import 'package:hadirku_web/features/personalization/models/roles_model.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../personalization/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

  // Get Authenticated user data
  User? get authUser => _auth.currentUser;

  // Called from main.app on app launch
  @override
  void onReady() {
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAllNamed(dashboardRoute);
    }
  }

  Future<void> saveCompanyRecord(CompanyModel comapny) async {
    try {
      await _db
          .collection(Endpoint.company)
          .doc(comapny.id)
          .set(comapny.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  Future<void> saveRolesRecord(RolesModel role) async {
    try {
      await _db.collection(Endpoint.roles).doc(role.id).set(role.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [Reauthentication] - Re Authenticate User
  Future<void> reAuthWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(authSignInRoute);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }

  /// [DeleteUser] - remove user auth and firebase account
  Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await FirebaseStorage.instance
          .ref()
          .child(
              "Users/Images/Profile/Me/${AuthenticationRepository.instance.authUser?.uid}.png")
          .delete();
      prefs.remove('REMEMBER_ME_EMAIL');
      prefs.remove('REMEMBER_ME_PASSWORD');
      prefs.remove('REMEMBER_ME');
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw Dictionary.somethingWentWrong;
    }
  }
}
