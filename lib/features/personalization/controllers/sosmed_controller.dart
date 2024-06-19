import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../data/repositories/personalization/sosmed_repository.dart';
import '../models/sosmed_model.dart';

class SosmedController extends GetxController {
  static SosmedController get instance => Get.find();

  String type = '';
  String url = '';
  final updateloading = false.obs;

  Rx<SosmedModel> sosmedModel = SosmedModel.empty().obs;
  final facebook = TextEditingController();
  final twitter = TextEditingController();
  final instagram = TextEditingController();
  final linkedin = TextEditingController();
  final website = TextEditingController();

  GlobalKey<FormState> keys = GlobalKey<FormState>();
  final sosmedRepo = Get.put(SosmedRepository());

  Widget returnIconFor(String type, {required Widget child}) {
    switch (type) {
      case Dictionary.facebook:
        return _customIcon(AppIcons.facebook, AppColor.facebook, child);
      case Dictionary.tweets:
        return _customIcon(AppIcons.tweets, AppColor.twitter, child);
      case Dictionary.instagram:
        return _customIcon(AppIcons.instagram, AppColor.instagram, child);
      case Dictionary.linkedin:
        return _customIcon(AppIcons.linkedin, AppColor.linkedin, child);
      case Dictionary.website:
        return _customIcon(AppIcons.website, AppColor.website, child);
      default:
        return _customIcon(AppIcons.facebook, AppColor.facebook, child);
    }
  }

  Widget _customIcon(String icon, Color color, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.sm),
                  bottomLeft: Radius.circular(SizeConfig.sm))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Center(
              child: SvgPicture.asset(icon,
                  width: SizeConfig.dl, color: AppColor.white),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchSosmed();
  }

  Future<void> fetchSosmed() async {
    try {
      updateloading.value = true;
      final ssm = await sosmedRepo.fetchUserSosmed();
      sosmedModel(ssm);
      updateloading.value = false;
    } catch (e) {
      sosmedModel(SosmedModel.empty());
    } finally {
      updateloading.value = false;
    }
  }

  Future<void> updateSosmed() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!keys.currentState!.validate()) {
        return;
      }
      if (type == Dictionary.facebook) {
        if (sosmedModel.value.url.isEmpty) {
          facebook.text.trim();
        }
        url = facebook.text;
      }
      if (type == Dictionary.tweets) {
        if (sosmedModel.value.url.isEmpty) {
          twitter.text.trim();
        }
        url = twitter.text;
      }

      updateloading.value = true;
      final sosmed =
          SosmedModel(id: sosmedModel.value.id, type: type, url: url);

      await sosmedRepo.updateSingleFieldSosmed(sosmed);

      sosmedModel.value.type = type;
      sosmedModel.value.url = url;
      sosmedModel.refresh();
    } catch (e) {
      e.toString();
    } finally {
      updateloading.value = false;
    }
  }
}
