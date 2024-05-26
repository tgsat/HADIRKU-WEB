import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'info_card.dart';

class DashboardCardLargeScreen extends StatelessWidget {
  const DashboardCardLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoCard(
          title:
              "${Dictionary.totalStaffing.capitalize} (${Dictionary.permissionStaffing})",
          value: "7",
          onTap: () {},
          status: Dictionary.inProgress,
        ),
        SizedBox(
          width: SizeConfig.maxWidth(context) / 64,
        ),
        InfoCard(
          title:
              "${Dictionary.totalStaffing.capitalize} (${Dictionary.precenseStaffing})",
          value: "17",
          status: Dictionary.delivered,
          onTap: () {},
        ),
        SizedBox(
          width: SizeConfig.maxWidth(context) / 64,
        ),
        InfoCard(
          title:
              "${Dictionary.totalStaffing.capitalize} (${Dictionary.alfaStaffing})",
          value: "3",
          status: Dictionary.cancel,
          onTap: () {},
        ),
        SizedBox(
          width: SizeConfig.maxWidth(context) / 64,
        ),
        InfoCard(
          title: "${Dictionary.totalStaffing.capitalize}",
          value: "32",
          onTap: () {},
          status: Dictionary.schedule,
        ),
      ],
    );
  }
}
