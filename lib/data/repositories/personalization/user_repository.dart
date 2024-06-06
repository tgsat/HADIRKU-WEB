import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/data/endpoint/endpoint.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/personalization/models/user_model.dart';
import '../authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Reference storage = FirebaseStorage.instance.ref();

  /// Function to save user data to firebase.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection(Endpoint.users).doc(user.id).set(user.toJson());
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

  // Fuction to fetch user details based user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final docSnapshot = await _db
          .collection(Endpoint.users)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
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

  // Fuction to update user data in firebase
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection(Endpoint.users)
          .doc(updateUser.id)
          .update(updateUser.toJson());
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

  // Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection(Endpoint.users)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  // Fuction to remove user data from firebase
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(Endpoint.users).doc(userId).delete();
      var collect = _db.collection(Endpoint.users);
      var snap = await collect.get();
      for (var doc in snap.docs) {
        await doc.reference.delete();
      }
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

  // Upload any image to storage firebase
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.path);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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

  Future<String> uploadUserImage(XFile image, String userID) async {
    try {
      final upload = storage.child("Users/Images/Profile/Me/$userID.png");
      await upload.putFile(File(image.path));
      final url = await upload.getDownloadURL();
      return url;
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
