import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirku_web/utils/utils.dart';
import 'package:image_network/image_network.dart';

class CircuralImage extends StatelessWidget {
  final double height, width, padding;
  final String img, title;
  final int? count;
  final bool isNetworkImg, isCustom;
  final Color? backgroundColor;
  final BoxFit fit;
  final double radius;
  final Function? onTap;
  const CircuralImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = SizeConfig.sm,
    required this.img,
    required this.title,
    this.count,
    this.isNetworkImg = false,
    this.isCustom = false,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.radius = 100,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: (isNetworkImg)
              ? backgroundColor ?? Colors.white
              : backgroundColor ??
                  HelperFunction.fixedColor(
                      HelperFunction.parseName(title, count)),
          borderRadius: BorderRadius.circular(radius)),
      child: isNetworkImg
          ? ImageNetwork(
              image: img,
              height: height,
              width: width,
              fitAndroidIos: fit,
              fitWeb: BoxFitWeb.cover,
              onTap: onTap,
              borderRadius: BorderRadius.circular(radius),
              onError: SvgPicture.asset(AppIcons.error),
              onLoading:
                  ShimmerEffect(width: width, height: height, radius: radius),
            )
          : isCustom
              ? Center(
                  child: Text('No Image',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: (isCustom == true)
                              ? Colors.black
                              : Colors.white)),
                )
              : Center(
                  child: Text(
                      HelperFunction.parseName(title, count).toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white)),
                ),
    );
  }
}
