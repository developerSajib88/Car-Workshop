import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  const EmptyWidget({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Center(
        child: Column(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [

            Image.asset(
              "assets/images/empty_data.png",
              width: 50.w,
              height: 50.h,
            ),

            Text(
              "No Data",
              style: CustomTextStyles.primaryTextStylesBold,
            ),

            SizedBox(
              width: 120.w,
              child: Text(
                message,
                style: CustomTextStyles.descriptionTextStyles,
                textAlign: TextAlign.center,
              ),
            ),

          ],
        )
      ),
    );
  }
}
