import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep2 extends HookConsumerWidget {
  const BookingStep2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [

        PrimaryTextFormFields(
          title: "Car Make",
          hintText: "e.g., Toyota, Ford",
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Car Model",
            hintText: "e.g., Corolla, Mustang"
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Car Year",
            hintText: "e.g., 2020"
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Registration Plate",
            hintText: "e.g., ABC-1234"
        ),



      ],
    );
  }
}
