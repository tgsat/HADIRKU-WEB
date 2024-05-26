import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/leave_table.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderTextDisplay(),
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
