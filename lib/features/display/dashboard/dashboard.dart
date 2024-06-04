import 'package:flutter/cupertino.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/card/dashboard_card_large.dart';
import 'widgets/card/dashboard_card_medium.dart';
import 'widgets/card/dashboard_card_small.dart';
import 'widgets/dashboard_table.dart';
import 'widgets/section/revenue_section_large.dart';
import 'widgets/section/revenue_section_small.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const DashboardCardMediumScreen()
                else
                  const DashboardCardLargeScreen()
              else
                const DashboardCardSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              const DashboardTable(),
            ],
          ),
        ),
      ],
    );
  }
}
