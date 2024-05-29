import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  final Rx<ConnectivityResult> _status = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _subscription =
        _connectivity.onConnectivityChanged.listen((_updateConnectionStatus));
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _status.value = result;
    if (_status.value == ConnectivityResult.none) {
      Loaders.warningWifiSnackBar(
          title: Dictionary.oops, message: Dictionary.noInternet);
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _subscription.cancel();
  }
}
