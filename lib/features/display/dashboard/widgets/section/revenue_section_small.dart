import 'package:hadirku_web/features/display/dashboard/widgets/cart/bar_chart.dart';
import 'package:hadirku_web/features/display/dashboard/widgets/section/revenue.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:flutter/material.dart';

class RevenueSectionSmall extends StatelessWidget {
  const RevenueSectionSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColor.lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: AppColor.lightGrey, width: .5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Revenue Chart",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.lightGrey)),
                SizedBox(
                    width: 600,
                    height: 200,
                    child: SimpleBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: AppColor.lightGrey,
          ),
          const SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(
                      title: "Toda's revenue",
                      amount: "230",
                    ),
                    RevenueInfo(
                      title: "Last 7 days",
                      amount: "1,100",
                    ),
                  ],
                ),
                Row(
                  children: [
                    RevenueInfo(
                      title: "Last 30 days",
                      amount: "3,230",
                    ),
                    RevenueInfo(
                      title: "Last 12 months",
                      amount: "11,300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
