
import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_1.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_2.dart';
import 'package:feature_first/features/admin/book_services/booking_step/booking_step_3.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookServiceScreen extends HookConsumerWidget {
  final int mechanicId;
  final String mechanicName;
  final String mechanicEmail;
  const BookServiceScreen({
    super.key,
    required this.mechanicId,
    required this.mechanicName,
    required this.mechanicEmail
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final adminState = ref.watch(adminProvider);
    final adminCtrl = ref.read(adminProvider.notifier);

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
        color: ColorPalates.defaultWhite,
        child: Stepper(
            currentStep: adminState.stepNumber,
            controlsBuilder: (context,_){
              return Container();
            },
            steps: <Step>[

              const Step(
                  title: Text("Booking Details"),
                  stepStyle: StepStyle(color: Colors.green),
                  content: BookingStep1()
              ),

              const Step(
                  title: Text("Car Details"),
                  stepStyle: StepStyle(color: Colors.green),
                  content: BookingStep2()
              ),


              Step(
                  title: const Text("Customer Details"),
                  stepStyle: const StepStyle(color: Colors.green),
                  content: BookingStep3(
                    mechanicId: mechanicId,
                    mechanicName: mechanicName,
                    mechanicEmail: mechanicEmail,
                  )
              ),

            ]
        ),
      ),
    );
  }
}
