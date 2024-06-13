import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirku_web/utils/utils.dart';

class CircuralImage extends StatelessWidget {
  final double height, width, padding;
  final String img;
  final bool isNetworkImg;
  final Color? overlayColor, backgroundColor;
  final BoxFit? fit;
  final double radius;
  const CircuralImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = SizeConfig.sm,
    required this.img,
    this.isNetworkImg = false,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.radius = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.white,
          borderRadius: BorderRadius.circular(radius)),
      child: Center(
        child: ClipOval(
          child: isNetworkImg
              ? SizedBox(
                  height: height,
                  width: width,
                  child: FastCachedImage(
                    url: img,
                    fit: fit,
                    errorBuilder: (context, exception, stacktrace) =>
                        SvgPicture.asset(AppIcons.error),
                    loadingBuilder: (context, progress) => ShimmerEffect(
                        width: width, height: height, radius: radius),
                  ),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(img),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
