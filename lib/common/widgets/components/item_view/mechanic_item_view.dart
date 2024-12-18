import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/utils/constants/image_constants.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicItemView extends StatelessWidget {
  final int mechanicId;
  final String mechanicName;
  final String email;
  final String mechanicImage;
  const MechanicItemView({
    super.key,
    required this.mechanicId,
    required this.mechanicName,
    required this.email,
    required this.mechanicImage
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      padding: padding6,
      margin: padding2,
      child: Row(
        children: [

          CircleAvatar(
            radius: 16.r,
            backgroundColor: ColorPalates.primaryColor,
            child: CircleAvatar(
                radius: 15.r,
                backgroundImage: NetworkImage(
                  mechanicImage
                )
            ),
          ),

          gap8,

          Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainCenter,
            children: [


              Text(
                "Mechanic ID: $mechanicId",
                style: CustomTextStyles.descriptionTextStyles,
              ),

              Text(
                "Mechanic: $mechanicName",
                style: CustomTextStyles.primaryTextStylesBold,
              ),

              Text(
                "Email: $email",
                style: CustomTextStyles.descriptionTextStyles,
              ),

            ],
          ),

          const Spacer(),

          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 10.sp,
            color: ColorPalates.customGrey,
          )



        ],
      ),
    );
  }
}
