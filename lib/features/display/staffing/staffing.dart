import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/staffing_table.dart';

class StaffingScreen extends StatelessWidget {
  const StaffingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const HeaderTextDisplay(),
        Expanded(
            child: ListView(
          children: const [StaffingTable()],
        )),
      ],
    );
  }
}
