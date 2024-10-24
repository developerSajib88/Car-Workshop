import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/common/widgets/data_view_widget.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechanicJobItemView extends StatelessWidget {
  final String customerName;
  final String customerNumber;
  final String startDate;
  final String endDate;
  const MechanicJobItemView({
    super.key,
    required this.customerName,
    required this.customerNumber,
    required this.startDate,
    required this.endDate
  });

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
          ),

          gap8,

        ],
      ),
    );
  }
}
