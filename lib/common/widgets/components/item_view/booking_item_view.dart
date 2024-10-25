import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/common/widgets/data_view_widget.dart';
import 'package:feature_first/utils/constants/image_constants.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingItemView extends StatelessWidget {
  final String mechanicId;
  final String mechanicName;
  final String email;
  final String customerName;
  final String customerNumber;
  final String startDate;
  final String endDate;
  final String mechanicImage;
  const BookingItemView({
    super.key,
    required this.mechanicId,
    required this.mechanicName,
    required this.email,
    required this.customerName,
    required this.customerNumber,
    required this.startDate,
    required this.endDate,
    required this.mechanicImage
  });

  @override
  Widget build(BuildContext context) {

    return BackgroundContainer(
      padding: padding6,
      margin: paddingBottom6,
      child: Column(
        children: [

          Row(
            children: [


              CircleAvatar(
                radius: 16.r,
                backgroundColor: ColorPalates.primaryColor,
                child: CircleAvatar(
                    radius: 15.r,
                    backgroundImage: NetworkImage(
                      mechanicImage,
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

          const Divider(),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              DataViewWidget(
                  data: customerName,
                  dataTitle: "Customer Name",
                  iconBackground: const Color(0xffE6F2FF),
                  iconColor: const Color(0xff097FFF),
                  icon: Icons.account_circle_outlined
              ),


              DataViewWidget(
                  data: customerNumber,
                  dataTitle: "Phone Number",
                  iconBackground: const Color(0xffFFF4E6),
                  iconColor: const Color(0xffFFB259),
                  icon: Icons.phone_in_talk_rounded,
              ),

              
            ],
          ),

          gap8,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              DataViewWidget(
                data: startDate,
                dataTitle: "Start DateTime",
                iconBackground: const Color(0xffEAFAEC),
                iconColor: const Color(0xff26CD3F),
                icon: Icons.calendar_month,
              ),



              DataViewWidget(
                data: endDate,
                dataTitle: "End DateTime  ",
                iconBackground: const Color(0xffFFECEB),
                iconColor: const Color(0xffFF2F24),
                icon: Icons.calendar_month,
              ),


            ],
          )

        ],
      ),
    );
  }
}
