import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingStep1 extends HookConsumerWidget {
  const BookingStep1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [

        PrimaryTextFormFields(
          title: "Booking Title",
          hintText: "e.g.Full Car Service, Oil Change",
          minLines: 4,
        ),

        gap8,

        PrimaryTextFormFields(
            title: "Start Date & Time",
            hintText: "e.g.2024-10-20 09:00 AM"
        ),

        gap8,

        PrimaryTextFormFields(
            title: "End Date & Time",
            hintText: "e.g., 2024-10-20 11:00 AM"
        ),


      ],
    );
  }
}
