import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? titleColor;
  final VoidCallback onPressed;
  const PrimaryButton(
      {super.key,
        this.isLoading = false,
        this.backgroundColor,
        this.titleColor,
        required this.title,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return WidgetBounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: 1.sw,
        height: 30.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: backgroundColor ?? ColorPalates.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x2B0B199D),
              blurRadius: 57.30,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x160B199D),
              blurRadius: 10.30,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: isLoading == false
            ? Text(
          title,
          style: CustomTextStyles.buttonTextStyles.copyWith(color: titleColor),
        )
            : SizedBox(
          width: 10.w,
          height: 10.w,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1.5.w,
          ),
        ),
      ),
    );
  }
}