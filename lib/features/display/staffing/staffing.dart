import 'package:flutter/material.dart';

import 'widgets/staffing_table.dart';

class StaffingScreen extends StatelessWidget {
  const StaffingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
            child: ListView(
          children: const [StaffingTable()],
        )),
      ],
    );
  }
}
