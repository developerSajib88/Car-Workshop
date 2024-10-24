import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';

class DataViewWidget extends StatelessWidget {

  const DataViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
