import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Widget? child;
  const BackgroundContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      height: height,
      padding: padding ?? padding4,
      margin: margin ?? padding4,
      decoration: ShapeDecoration(
        color: backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}