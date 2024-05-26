import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class BottomNavigationAuth extends StatelessWidget {
  final String title, subTitle;
  final Function() onTap;
  const BottomNavigationAuth(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonOpacity(
        onTap: onTap,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: title, style: Theme.of(context).textTheme.labelMedium),
            TextSpan(
                text: subTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: AppColor.active,
                    decoration: TextDecoration.underline))
          ]),
        ),
      ),
    );
  }
}
