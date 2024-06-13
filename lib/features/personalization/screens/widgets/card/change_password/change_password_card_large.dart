import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../controllers/user_controller.dart';
import '../profile_header_card.dart';

class ChangePasswordCardLarge extends StatefulWidget {
  const ChangePasswordCardLarge({super.key});

  @override
  State<ChangePasswordCardLarge> createState() =>
      _ChangePasswordCardLargeState();
}

class _ChangePasswordCardLargeState extends State<ChangePasswordCardLarge> {
  final controller = UserController.instance;
  final name = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();

  @override
  void initState() {
    name.text = controller.user.value.fullName;
    email.text = controller.user.value.email;
    bio.text = controller.user.value.bioData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderCard(
      label: Dictionary.profile,
      child: Form(
        key: controller.changePasswordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLayoutTextFormField(
                        title: Dictionary.name,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: name,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.name, value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.email,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: email,
                          readOnly: true,
                          textInputType: TextInputType.emailAddress,
                          validate: (value) => Validator.validateEmail(value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.bio,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          maxLines: 3,
                          maxLength: 150,
                          controller: bio,
                          isDense: true,
                          textInputType: TextInputType.multiline,
                        ),
                      ),
                      CustomLayoutTextFormField(
                        title: Dictionary.name,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: name,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.name, value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.email,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: email,
                          readOnly: true,
                          textInputType: TextInputType.emailAddress,
                          validate: (value) => Validator.validateEmail(value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.bio,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          maxLines: 3,
                          maxLength: 150,
                          controller: bio,
                          isDense: true,
                          textInputType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: SizeConfig.spaceBtwInputFiels),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLayoutTextFormField(
                        title: Dictionary.name,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: name,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.name, value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.email,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: email,
                          readOnly: true,
                          textInputType: TextInputType.emailAddress,
                          validate: (value) => Validator.validateEmail(value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.bio,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          maxLines: 3,
                          maxLength: 150,
                          controller: bio,
                          isDense: true,
                          textInputType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: SizeConfig.spaceBtwInputFiels),
            ButtonPrimary(
              title: Dictionary.update,
              isCustom: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
