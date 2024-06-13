import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;
  const CustomTabBar({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: TabBar(
                tabs: tabs,
                controller: controller,
                isScrollable: true,
                indicatorWeight: 2,
                labelColor: AppColor.white,
                indicatorColor: AppColor.active,
                indicator: BoxDecoration(
                    color: AppColor.active,
                    borderRadius: BorderRadius.circular(8)),
                unselectedLabelColor: Colors.black,
                labelStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
