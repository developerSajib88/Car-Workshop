import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/background_container.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
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
            currentStep: 0,
            steps: [

              Step(
                  title: const Text("Booking Details"),
                  content: Column(
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
                  )
              ),

              Step(
                  title: const Text("Car Details"),
                  content: Column(
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
                  )
              ),


              Step(
                  title: const Text("Customer Details"),
                  content: Column(
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
                  )
              ),


            ]
        ),
      ),
    );
  }
}
