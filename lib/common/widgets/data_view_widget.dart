import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';

class DataViewWidget extends StatelessWidget {
  final String data;
  final String dataTitle;
  final Color iconBackground;
  final Color iconColor;
  final IconData icon;
  const DataViewWidget({
    super.key,
    required this.data,
    required this.dataTitle,
    required this.iconBackground,
    required this.iconColor,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
            backgroundColor: iconBackground,
            child: Icon(
              icon,
              color: iconColor,
            )
        ),

        gap6,

        Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              dataTitle,
              style: CustomTextStyles.primaryTextStylesBold.copyWith(
                  fontSize: 7.sp
              ),
            ),

            Text(
              data,
              style: CustomTextStyles.descriptionTextStyles,
            )

          ],
        )
      ],
    );
  }
}
