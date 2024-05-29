import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
