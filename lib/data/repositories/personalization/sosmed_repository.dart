import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/personalization/models/sosmed_model.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../endpoint/endpoint.dart';
import '../authentication/authentication_repository.dart';

class SosmedRepository extends GetxController {
  static SosmedRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
  final authRepository = AuthenticationRepository.instance.authUser?.uid;

  Future<SosmedModel> fetchUserSosmed() async {
    try {
      final userId = authRepository;
      if (userId!.isEmpty) throw 'Tidak ada user tersedia';

      final result = await _db
          .collection(Endpoint.users)
          .doc(userId)
          .collection(Endpoint.sosmed)
          .doc()
          .get();
      if (result.exists) {
        return SosmedModel.fromSnapshot(result);
      } else {
        return SosmedModel.empty();
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

  Future<void> updateSingleFieldSosmed(SosmedModel model) async {
    try {
      final userId = authRepository;
      await _db
          .collection(Endpoint.users)
          .doc(userId)
          .collection(Endpoint.sosmed)
          .doc(model.id)
          .set(model.toJson());
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
