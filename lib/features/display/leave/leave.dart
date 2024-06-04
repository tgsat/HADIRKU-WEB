import 'package:flutter/material.dart';

import 'widgets/leave_table.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
            child: ListView(
          children: const [
            LeaveTable(),
          ],
        )),
      ],
    );
  }
}
