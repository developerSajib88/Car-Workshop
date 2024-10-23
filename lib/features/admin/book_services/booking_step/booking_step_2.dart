import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep2 extends HookConsumerWidget {
  const BookingStep2({super.key});

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
            controller: adminState.carCompanyController,
            isRequired: true,
            title: "Car Make",
            hintText: "e.g., Toyota, Ford",
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.carModelController,
              isRequired: true,
              title: "Car Model",
              hintText: "e.g., Corolla, Mustang"
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.carYearController,
              isRequired: true,
              title: "Car Year",
              hintText: "e.g., 2020"
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.carRegPlateController,
              isRequired: true,
              title: "Registration Plate",
              hintText: "e.g., ABC-1234"
          ),

          gap12,

          WidgetBounce(
            onPressed: (){
              if(formKey.currentState!.validate()){
                adminCtrl.bookingStepUpdate(step: 2);
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
