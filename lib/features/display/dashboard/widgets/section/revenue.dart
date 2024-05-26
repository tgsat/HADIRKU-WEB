import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class RevenueInfo extends StatelessWidget {
  final String? title;
  final String? amount;

  const RevenueInfo({super.key, this.title, this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "$title \n\n",
                style:
                    const TextStyle(color: AppColor.lightGrey, fontSize: 16)),
            TextSpan(
                text: "\$ $amount",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ])),
    );
  }
}
