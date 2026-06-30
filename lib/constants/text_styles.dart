import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

class AppTextStyles {

  static final hero = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: textDark,
    height: 1.2,
  );

  static final heading = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: textDark,
  );

  static final title = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: textDark,
  );

  static final subtitle = TextStyle(
    fontSize: 15.sp,
    color: subtitleColor,
    height: 1.5,
  );

  static final body = TextStyle(
    fontSize: 16.sp,
    color: textDark,
    height: 1.8,
  );

  static final button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final price = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: accentPink,
  );

  static final small = TextStyle(
    fontSize: 13.sp,
    color: subtitleColor,
  );
}