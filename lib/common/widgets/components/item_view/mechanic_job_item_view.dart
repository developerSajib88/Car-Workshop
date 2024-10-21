import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicJobItemView extends StatelessWidget {
  const MechanicJobItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      padding: padding6,
      margin: paddingBottom6,
      child: Column(
        children: [




          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffE6F2FF),
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Color(0xff097FFF),
                      )
                  ),

                  gap6,

                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "Custom Name",
                        style: CustomTextStyles.primaryTextStylesBold.copyWith(
                            fontSize: 7.sp
                        ),
                      ),

                      Text(
                        "Sajib Hasan",
                        style: CustomTextStyles.descriptionTextStyles,
                      )

                    ],
                  )
                ],
              ),

              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffFFF4E6),
                      child: Icon(
                        Icons.phone_in_talk_rounded,
                        color: Color(0xffFFB259),
                      )
                  ),

                  gap6,

                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "Phone Number",
                        style: CustomTextStyles.primaryTextStylesBold.copyWith(
                            fontSize: 7.sp
                        ),
                      ),

                      Text(
                        "01925561258",
                        style: CustomTextStyles.descriptionTextStyles,
                      )

                    ],
                  )
                ],
              )

            ],
          ),

          gap8,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffEAFAEC),
                      child: Icon(
                        Icons.calendar_month,
                        color: Color(0xff26CD3F),
                      )
                  ),

                  gap6,

                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "Start DateTime",
                        style: CustomTextStyles.primaryTextStylesBold.copyWith(
                            fontSize: 7.sp
                        ),
                      ),

                      Text(
                        "12 Jan 20245",
                        style: CustomTextStyles.descriptionTextStyles,
                      )

                    ],
                  )
                ],
              ),


              Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: Color(0xffFFECEB),
                      child: Icon(
                        Icons.date_range,
                        color: Color(0xffFF2F24),
                      )
                  ),

                  gap6,

                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "End DateTime  ",
                        style: CustomTextStyles.primaryTextStylesBold.copyWith(
                            fontSize: 7.sp
                        ),
                      ),

                      Text(
                        "12 Jan 20245",
                        style: CustomTextStyles.descriptionTextStyles,
                      )

                    ],
                  )
                ],
              )

            ],
          ),

          gap8,

        ],
      ),
    );
  }
}