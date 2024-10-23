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

    final adminState = ref.watch(adminProvider);
    final adminCtrl = ref.read(adminProvider.notifier);

    return Column(
      children: [

        PrimaryTextFormFields(
          title: "Name",
          hintText: "e.g., John Doe",
          minLines: 4,
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Phone",
            hintText: "e.g., (123) 456-7890"
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Email",
            hintText: "e.g., johndoe@example.com"
        ),

        gap12,

        WidgetBounce(
          onPressed: (){

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
    );
  }
}
