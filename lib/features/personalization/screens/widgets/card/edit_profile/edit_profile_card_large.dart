import 'package:flutter/material.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/profile_header_card.dart';
import 'package:hadirku_web/utils/utils.dart';

class EditProfileCardLarge extends StatefulWidget {
  const EditProfileCardLarge({super.key});

  @override
  State<EditProfileCardLarge> createState() => _EditProfileCardLargeState();
}

class _EditProfileCardLargeState extends State<EditProfileCardLarge> {
  late String gender, status, religius, golda;
  final ktp = TextEditingController();
  final kk = TextEditingController();
  final birthdate = TextEditingController();
  final address = TextEditingController();
  final fullAddressKtp = TextEditingController();
  final otherPhoneNumber = TextEditingController();
  final emergencyPhoneNumber = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final ortuName = TextEditingController();
  final jumlahSodara = TextEditingController();

  @override
  void initState() {
    gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderCard(
      button: ButtonPrimary(
        title: Dictionary.update,
        isCustom: false,
        onTap: () {},
      ),
      label: Dictionary.profile,
      child: Form(
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
                        title: Dictionary.nomorKTP,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: ktp,
                          title: Dictionary.nomorKTP,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.nomorKTP, value),
                        ),
                      ),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.nomorKK,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: kk,
                          title: Dictionary.nomorKartuKeluarga,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.nomorKK, value),
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
                          title: Dictionary.gender,
                          isScreen: true,
                          rightFlex: 5,
                          child: Row(
                            children: [
                              RadioButtonTile(
                                title: "Male",
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioButtonTile(
                                title: "Female",
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioButtonTile(
                                title: "Other",
                                value: "other",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              )
                            ],
                          )),
                      const SizedBox(height: SizeConfig.spaceBtwInputFiels),
                      CustomLayoutTextFormField(
                        title: Dictionary.nomorKK,
                        isScreen: true,
                        rightFlex: 5,
                        child: CustomTextFormField(
                          controller: kk,
                          title: Dictionary.nomorKartuKeluarga,
                          validate: (value) => Validator.validateEmptyText(
                              Dictionary.nomorKK, value),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
