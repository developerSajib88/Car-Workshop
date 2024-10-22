
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextFormFields extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? isRequired;
  final bool? showSuffixIcon;
  final bool? passwordVisibility;
  final bool? showPrefixIcon;
  final bool? enable;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final VoidCallback? prefixIconPressed;
  final VoidCallback? suffixIconPressed;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final int? minLines;
  final Function()? onTap;

  const PrimaryTextFormFields({
    super.key,
    required this.title,
    required this.hintText,
    this.isRequired,
    this.showSuffixIcon,
    this.showPrefixIcon,
    this.enable,
    this.hintTextStyle,
    this.suffixIcon,
    this.textInputType,
    this.prefixIconPressed,
    this.passwordVisibility,
    this.suffixIconPressed,
    this.validator,
    this.controller,
    this.readOnly = false,
    this.minLines,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fieldBorder = OutlineInputBorder(
        borderRadius: radius4,
        borderSide: BorderSide(color: ColorPalates.primaryColor, width: 0.5.w)
    );

    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Text(title, style: CustomTextStyles.primaryTextStyles),
            if (isRequired == true)
              Text("*", style: CustomTextStyles.primaryTextStyles.copyWith(color: ColorPalates.primaryColor)),
          ],
        ),
        SizedBox(
          width: 1.sw,
          child: TextFormField(
            onTap: onTap,
            controller: controller,
            readOnly: readOnly,
            minLines: minLines ?? 1,
            maxLines: minLines ?? 1,
            keyboardType: textInputType,
            cursorColor: ColorPalates.primaryColor,
            obscureText: passwordVisibility ?? false,
            enabled: enable ?? true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: padding6,
              suffixIcon: showSuffixIcon == true && suffixIcon == null
                  ? IconButton(
                onPressed: suffixIconPressed,
                icon: Icon(
                  passwordVisibility == true
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: ColorPalates.secondaryColor,
                ),
              )
                  : suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 7.sp,
                  color: ColorPalates.customGrey
              ),
              enabledBorder: fieldBorder,
              focusedBorder: fieldBorder,
              //errorBorder: fieldBorder,
              border: fieldBorder,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}