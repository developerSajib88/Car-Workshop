import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep3 extends HookConsumerWidget {
  const BookingStep3({super.key});

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
            controller: adminState.customerNameController,
            isRequired: true,
            title: "Name",
            hintText: "e.g,John Doe",
            minLines: 4,
            validator: (value)=> FormValidation(
                validationType: ValidationType.name,
                formValue: value
            ).validate(),
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.customerPhoneController,
              isRequired: true,
              title: "Phone",
              hintText: "e.g,01938327825",
              validator: (value)=> FormValidation(
                  validationType: ValidationType.phone,
                  formValue: value
              ).validate(),
          ),

          gap8,

          PrimaryTextFormFields(
              controller: adminState.customerEmailController,
              isRequired: true,
              title: "Email",
              hintText: "e.g,johndoe@example.com",
              validator: (value)=> FormValidation(
                  validationType: ValidationType.email,
                  formValue: value
              ).validate(),
          ),

          gap12,

          WidgetBounce(
            onPressed: (){
              if(formKey.currentState!.validate()){

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
