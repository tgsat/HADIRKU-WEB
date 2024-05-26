import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'info_card_small.dart';

class DashboardCardSmallScreen extends StatelessWidget {
  const DashboardCardSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title:
                "${Dictionary.totalStaffing.capitalize} (${Dictionary.permissionStaffing})",
            value: "7",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: SizeConfig.maxWidth(context) / 64,
          ),
          InfoCardSmall(
            title:
                "${Dictionary.totalStaffing.capitalize} (${Dictionary.precenseStaffing})",
            value: "17",
            onTap: () {},
          ),
          SizedBox(
            height: SizeConfig.maxWidth(context) / 64,
          ),
          InfoCardSmall(
            title:
                "${Dictionary.totalStaffing.capitalize} (${Dictionary.alfaStaffing})",
            value: "3",
            onTap: () {},
          ),
          SizedBox(
            height: SizeConfig.maxWidth(context) / 64,
          ),
          InfoCardSmall(
            title: "${Dictionary.totalStaffing.capitalize}",
            value: "32",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
