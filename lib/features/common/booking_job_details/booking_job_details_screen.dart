import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/data_view_widget.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookingJobDetailsScreen extends StatelessWidget {
  final String bookingTitle;
  final String startDate;
  final String endDate;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String carCompany;
  final String carModel;
  final String registrationPlate;
  final String carYear;
  const BookingJobDetailsScreen({
    super.key,
    required this.bookingTitle,
    required this.startDate,
    required this.endDate,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.carCompany,
    required this.carModel,
    required this.registrationPlate,
    required this.carYear
  });

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
                      bookingTitle,
                      style: CustomTextStyles.primaryTextStylesBold,
                      textAlign: TextAlign.left,
                    ),

                    const Divider(),

                    DataViewWidget(
                        data: startDate,
                        dataTitle: "Start DateTime",
                        iconBackground: const Color(0xffEAFAEC),
                        iconColor: const Color(0xff26CD3F),
                        icon: Icons.calendar_month
                    ),


                    gap4,

                    DataViewWidget(
                        data: endDate,
                        dataTitle: "End DateTime  ",
                        iconBackground: const Color(0xffFFECEB),
                        iconColor: const Color(0xffFF2F24),
                        icon: Icons.date_range
                    ),

                    gap4,

                    DataViewWidget(
                        data: customerName,
                        dataTitle: "Customer Name  ",
                        iconBackground: const Color(0xffE6F2FF),
                        iconColor: const Color(0xff097FFF),
                        icon: Icons.account_circle_outlined
                    ),


                    gap4,


                    DataViewWidget(
                        data: customerPhone,
                        dataTitle: "Phone Number",
                        iconBackground: const Color(0xffFFF4E6),
                        iconColor: const Color(0xffFFB259),
                        icon: Icons.phone_in_talk_rounded
                    ),



                    gap4,


                    DataViewWidget(
                        data: customerEmail,
                        dataTitle: "Customer Email",
                        iconBackground: const Color(0xffEAFAEC),
                        iconColor: const Color(0xff26CD3F),
                        icon: Icons.mail_outline_rounded
                    ),



                    const Divider(),

                    DataViewWidget(
                        data: carCompany,
                        dataTitle: "Company",
                        iconBackground: const Color(0xffE6F2FF),
                        iconColor: const Color(0xff097FFF),
                        icon: Icons.precision_manufacturing
                    ),

                    gap4,


                    DataViewWidget(
                        data: carModel,
                        dataTitle: "Car Model",
                        iconBackground: const Color(0xffFFF4E6),
                        iconColor: const Color(0xffFFB259),
                        icon: Icons.directions_car_filled_outlined
                    ),


                    gap4,

                    DataViewWidget(
                        data: registrationPlate,
                        dataTitle: "Registration Plate",
                        iconBackground: const Color(0xffE6F2FF),
                        iconColor: const Color(0xff097FFF),
                        icon: Icons.app_registration
                    ),


                    gap4,


                    DataViewWidget(
                        data: registrationPlate,
                        dataTitle: "Registration Plate",
                        iconBackground: const Color(0xffFFF4E6),
                        iconColor: const Color(0xffFFB259),
                        icon: Icons.date_range
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
