import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hadirku_web/utils/value/app_color.dart';

class CustomLoading {
  static SpinKitThreeBounce spinKitThreeBounce() => SpinKitThreeBounce(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven
                  ? AppColor.active
                  : AppColor.active.withOpacity(.7),
            ),
          );
        },
      );
}
