import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstraints {
  static const Size designSize = Size(375, 812);
  static final padding = 20.w;

  static const radius = 16.0;
  static const borderRadius = BorderRadius.all(Radius.circular(radius));
  static const borderRadiusTLR = BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );
}
