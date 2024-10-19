
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  const LogoWidget({super.key, this.width = 130});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
          "assets/images/app_logo.png",
          fit: BoxFit.cover,
          width: width.w,
          //height: 25.h,
        ));
  }
}