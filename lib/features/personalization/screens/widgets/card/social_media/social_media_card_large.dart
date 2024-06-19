import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadirku_web/features/personalization/controllers/sosmed_controller.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/profile_header_card.dart';
import 'package:hadirku_web/utils/utils.dart';

class SocialMediaCardLarge extends StatelessWidget {
  const SocialMediaCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SosmedController());
    return ProfileHeaderCard(
      button: ButtonAdittional(
        title: Dictionary.add,
        onTap: () => controller.updateSosmed(),
      ),
      label: Dictionary.socialMedia,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => controller.updateloading.value
                  ? const SosmedShimmerEffect()
                  : controller.returnIconFor(
                      Dictionary.facebook,
                      child: SosmedTextFormField(
                        title: Dictionary.facebookLink,
                        controller: controller.facebook,
                      ),
                    ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => controller.updateloading.value
                  ? const SosmedShimmerEffect()
                  : controller.returnIconFor(
                      Dictionary.tweets,
                      child: SosmedTextFormField(
                        title: Dictionary.tweetsLink,
                        controller: controller.twitter,
                      ),
                    ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => controller.updateloading.value
                  ? const SosmedShimmerEffect()
                  : controller.returnIconFor(
                      Dictionary.instagram,
                      child: SosmedTextFormField(
                        title: Dictionary.instagramLink,
                        controller: controller.instagram,
                      ),
                    ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => controller.updateloading.value
                  ? const SosmedShimmerEffect()
                  : controller.returnIconFor(
                      Dictionary.linkedin,
                      child: SosmedTextFormField(
                        title: Dictionary.linkedinLink,
                        controller: controller.linkedin,
                      ),
                    ),
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            Obx(
              () => controller.updateloading.value
                  ? const SosmedShimmerEffect()
                  : controller.returnIconFor(
                      Dictionary.website,
                      child: SosmedTextFormField(
                        title: Dictionary.websiteLink,
                        controller: controller.website,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
