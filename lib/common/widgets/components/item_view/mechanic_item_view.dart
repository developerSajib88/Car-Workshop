import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicItemView extends StatelessWidget {
  const MechanicItemView({super.key});

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
                backgroundImage: const NetworkImage(
                  "https://img.freepik.com/free-photo/smiling-auto-mechanic-with-wrench-standing-hands-folded-white-background_662251-2939.jpg",
                )
            ),
          ),

          gap8,

          Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainCenter,
            children: [


              Text(
                "Mechanic ID: 230943",
                style: CustomTextStyles.descriptionTextStyles,
              ),

              Text(
                "Mechanic: Sajib Hasan",
                style: CustomTextStyles.primaryTextStylesBold,
              ),

              Text(
                "Email: developersajib88@gmail.com",
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
