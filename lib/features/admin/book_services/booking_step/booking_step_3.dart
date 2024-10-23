import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep3 extends HookConsumerWidget {
  const BookingStep3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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


      ],
    );
  }
}
