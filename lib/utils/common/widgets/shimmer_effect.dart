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
    this.radius = 100,
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

class NormalShimmerEffect extends StatelessWidget {
  final bool normal;
  const NormalShimmerEffect({super.key, this.normal = true});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
        height: normal ? 48 : 88, width: double.infinity, radius: 8);
  }
}

class SosmedShimmerEffect extends StatelessWidget {
  const SosmedShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShimmerEffect(height: 48, width: double.infinity, radius: 8);
  }
}
