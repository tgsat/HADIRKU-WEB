import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? AppColor.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
