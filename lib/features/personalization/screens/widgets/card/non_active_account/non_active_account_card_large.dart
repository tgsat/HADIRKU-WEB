import 'package:flutter/material.dart';
import 'package:hadirku_web/features/personalization/screens/widgets/card/profile_header_card.dart';
import 'package:hadirku_web/utils/utils.dart';

import '../../../../controllers/user_controller.dart';

class NonActiveAccountCardLarge extends StatelessWidget {
  const NonActiveAccountCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final theme = Theme.of(context).textTheme;
    return ProfileHeaderCard(
      label: Dictionary.nonActiveAccount,
      button: Container(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Perhatian ${Dictionary.nonActiveAccount}:',
              style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeConfig.md),
            child: Text(
                '1. Kamu akan secara otomatis keluar dan tidak dapat menggunakan Aplikasi Absensi Hadirku.\n2. Semua data kamu akan terhapus secara permanent.\n3. Pastikan bahwa kamu benar" akan menghapus akun kamu.',
                textAlign: TextAlign.start,
                style: theme.labelMedium),
          ),
          const SizedBox(height: SizeConfig.spaceBtwInputFiels),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonAdittional(
                title: Dictionary.deleteAccount,
                onTap: () => controller.deleteUserAccount(),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
