import 'package:feature_first/app/app.dart';
import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep1 extends HookConsumerWidget {
  const BookingStep1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final adminState = ref.watch(adminProvider);
    final adminCtrl = ref.read(adminProvider.notifier);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [

          PrimaryTextFormFields(
            controller: adminState.titleController,
            isRequired: true,
            title: "Booking Title",
            hintText: "e.g.Full Car Service, Oil Change",
            minLines: 4,
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.startDateTimeController,
              isRequired: true,
              title: "Start Date & Time",
              hintText: "e.g.2024-10-20 09:00 AM"
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.endDateTimeController,
              isRequired: true,
              title: "End Date & Time",
              hintText: "e.g., 2024-10-20 11:00 AM"
          ),

          gap12,


          WidgetBounce(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  adminCtrl.bookingStepUpdate(step: 1);
                }
              },
              child: Container(
                width: 60.w,
                height: 25.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: radius4
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
          )


        ],
      ),
    );
  }
}
