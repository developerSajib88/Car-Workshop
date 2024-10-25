import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/dashboard/dashboard_screen.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BookingStep3 extends HookConsumerWidget {
  final int mechanicId;
  final String? mechanicImage;
  final String? mechanicPhone;
  final String mechanicName;
  final String mechanicEmail;
  const BookingStep3({
    super.key,
    required this.mechanicId,
    required this.mechanicImage,
    required this.mechanicPhone,

    required this.mechanicName,
    required this.mechanicEmail
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final authenticationState = ref.watch(authenticationProvider);
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
                adminCtrl.createBookingService(
                    adminId: authenticationState.userModel?.userId ?? 00000,
                    mechanicId: mechanicId,
                    mechanicImage: mechanicImage,
                    mechanicName: mechanicName,
                    mechanicPhone: mechanicPhone,
                    mechanicEmail: mechanicEmail
                ).then((value){
                  if(value ?? false){
                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
                  }
                });
              }
            },
            child:Container(
              width: 60.w,
              height: 25.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: radius4
              ),
              child: Visibility(
                visible: adminState.isLoading,
                replacement: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                child: Center(
                    child: SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: CircularProgressIndicator(
                          color: ColorPalates.defaultWhite,
                        )
                    )
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
