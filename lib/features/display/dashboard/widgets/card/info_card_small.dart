import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function() onTap;

  const InfoCardSmall({
    super.key,
    required this.title,
    required this.value,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                  color: isActive ? AppColor.active : AppColor.lightGrey,
                  width: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                            color:
                                isActive ? AppColor.active : AppColor.lightGrey,
                          )),
                ),
                Text(value,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: isActive ? AppColor.active : AppColor.dark))
              ],
            )),
      ),
    );
  }
}
