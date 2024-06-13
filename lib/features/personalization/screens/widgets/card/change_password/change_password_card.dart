// import 'package:flutter/material.dart';
// import 'package:hadirku_web/features/personalization/screens/widgets/card/change_password/change_password_card_large.dart';
// import 'package:hadirku_web/features/personalization/screens/widgets/card/profile_header_card.dart';
// import 'package:hadirku_web/utils/utils.dart';

// class ChangePasswordCard extends StatelessWidget {
//   const ChangePasswordCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ProfileHeaderCard(
//       label: Dictionary.profile,
//       child: ListView(
//         shrinkWrap: true,
//         children: [
//           if (ResponsiveWidget.isLargeScreen(context) ||
//               ResponsiveWidget.isMediumScreen(context))
//             const ChangePasswordCardLarge()
//           else
//             const ChangePasswordCardLarge(), // small
//         ],
//       ),
//     );
//   }
// }
