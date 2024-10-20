import 'package:feature_first/app/app.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalates.primaryColor,
        leading: BackButton(
          color: ColorPalates.defaultWhite,
        ),
        title: Text(
          "Booking Details",
          style: CustomTextStyles.primaryTextStyles.copyWith(
              color: ColorPalates.defaultWhite
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: 1.sw,
                height: 110.w,
                alignment: Alignment.topCenter,
                color: ColorPalates.primaryColor,
                child: Image.asset(
                  "assets/images/red_car.png",
                  width: 150.w,
                  height: 100.h,
                ).animate().slideX(),

              ),

              ImageBackground(
                child: Column(
                  children: [

                    Text(
                        "Objective: Develop a cross-platform mobile application for a car workshop where users",
                      style: CustomTextStyles.primaryTextStylesBold,
                      textAlign: TextAlign.left,
                    ),

                    const Divider(),


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


                    gap4,


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
                    ),

                    gap4,

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

                    gap4,


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
                    ),

                    gap4,


                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Color(0xffEAFAEC),
                            child: Icon(
                              Icons.mail_outline_rounded,
                              color: Color(0xff26CD3F),
                            )
                        ),

                        gap6,

                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Text(
                              "Customer Email",
                              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                                  fontSize: 7.sp
                              ),
                            ),

                            Text(
                              "developersajib88@gmail.com",
                              style: CustomTextStyles.descriptionTextStyles,
                            )

                          ],
                        )
                      ],
                    ),


                    const Divider(),


                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Color(0xffE6F2FF),
                            child: Icon(
                              Icons.precision_manufacturing,
                              color: Color(0xff097FFF),
                            )
                        ),

                        gap6,

                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Text(
                              "Company",
                              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                                  fontSize: 7.sp
                              ),
                            ),

                            Text(
                              "Tesla Cybertruck",
                              style: CustomTextStyles.descriptionTextStyles,
                            )

                          ],
                        )
                      ],
                    ),

                    gap4,

                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Color(0xffFFF4E6),
                            child: Icon(
                              Icons.directions_car_filled_outlined,
                              color: Color(0xffFFB259),
                            )
                        ),

                        gap6,

                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Text(
                              "Car Model",
                              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                                  fontSize: 7.sp
                              ),
                            ),

                            Text(
                              "Tesla Model S",
                              style: CustomTextStyles.descriptionTextStyles,
                            )

                          ],
                        )
                      ],
                    ),

                    gap4,

                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Color(0xffE6F2FF),
                            child: Icon(
                              Icons.app_registration,
                              color: Color(0xff097FFF),
                            )
                        ),

                        gap6,

                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Text(
                              "Registration Plate",
                              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                                  fontSize: 7.sp
                              ),
                            ),

                            Text(
                              "P 68 CC",
                              style: CustomTextStyles.descriptionTextStyles,
                            )

                          ],
                        )
                      ],
                    ),

                    gap4,


                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Color(0xffFFF4E6),
                            child: Icon(
                              Icons.date_range,
                              color: Color(0xffFFB259),
                            )
                        ),

                        gap6,

                        Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Text(
                              "Year",
                              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                                  fontSize: 7.sp
                              ),
                            ),

                            Text(
                              "2020",
                              style: CustomTextStyles.descriptionTextStyles,
                            )

                          ],
                        )
                      ],
                    ),




                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
