
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_1.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_2.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_3.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookServiceScreen extends HookConsumerWidget {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalates.primaryColor,
        leading: BackButton(
          color: ColorPalates.defaultWhite,
        ),
        title: Text(
          "Booking Service",
          style: CustomTextStyles.primaryTextStyles.copyWith(
              color: ColorPalates.defaultWhite
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding2,
        child: Stepper(
            currentStep: 1,
            steps: const <Step>[

              Step(
                  title: Text("Booking Details"),
                  content: BookingStep1()
              ),

              Step(
                  title: Text("Car Details"),
                  content: BookingStep2()
              ),


              Step(
                  title: Text("Customer Details"),
                  content: BookingStep3()
              ),

            ]
        ),
      ),
    );
  }
}
