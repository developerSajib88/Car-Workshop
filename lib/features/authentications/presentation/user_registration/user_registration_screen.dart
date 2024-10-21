import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/logo_widget.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:feature_first/utils/utils.dart';

class UserRegistrationScreen extends HookConsumerWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authencationState = ref.watch(authenticationProvider);
    final authencationCtrl = ref.watch(authenticationProvider.notifier);

    return Scaffold(
        body: ImageBackground(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: crossCenter,
                mainAxisAlignment: mainCenter,
                children: [


                  const LogoWidget(),

                  gap12,

                  Text(
                    "Create Your Account",
                    style: CustomTextStyles.titleTextStyles,
                  ),

                  gap4,

                  Text(
                    "Sign up to schedule and manage car service bookings with ease.",
                    style: CustomTextStyles.primaryTextStyles,
                    textAlign: TextAlign.center,
                  ),

                  gap8,

                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      PrimaryTextFormFields(
                          controller: authencationState.emailController,
                          title: "Email",
                          hintText: "demo@gmail.com"
                      ),

                      gap8,

                      PrimaryTextFormFields(
                        controller: authencationState.passwordController,
                        title: "Password",
                        hintText: "*******",
                        showSuffixIcon: true,
                      ),

                      gap8,

                      PrimaryTextFormFields(
                        controller: authencationState.confirmPasswordController,
                        title: "Confirm Password",
                        hintText: "*******",
                        showSuffixIcon: true,
                      ),


                      gap8,

                      const Text(
                        "Registration as an Admin/Mechanic",
                      ),

                      Row(
                        children: [
                          RadioMenuButton(
                            value: "Admin",
                            groupValue: authencationState.selectedUserType,
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(padding0),
                            ),
                            onChanged: (value)=> authencationCtrl.selectUserType(userType: value ?? "Admin"),
                            child: const Text("Admin"),
                          ),

                          gap6,

                          RadioMenuButton(
                            value: "Mechanic",
                            groupValue: authencationState.selectedUserType,
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(padding0),
                            ),
                            onChanged: (value)=> authencationCtrl.selectUserType(userType: value ?? "Mechanic"),
                            child: const Text("Mechanic"),
                          ),
                        ],
                      ),
                    ],
                  ),



                  PrimaryButton(
                      title: "Sign Up",
                      onPressed: (){
                        authencationCtrl.createUserAccount();
                        //Navigator.push(context,CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
                      }
                  ),


                  gap6,

                  Row(
                    crossAxisAlignment: crossCenter,
                    mainAxisAlignment: mainStart,
                    children: [
                      Text(
                        "Already you have account?",
                        style: CustomTextStyles.primaryTextStyles,
                      ),
                      gap2,
                      InkWell(
                          onTap: (){},
                          child: Text(
                            "Log In",
                            style: CustomTextStyles.buttonTextStyles
                                .copyWith(color: ColorPalates.primaryColor),
                          )),
                    ],
                  ),


                ],
              ),
            )

        )
    );
  }
}
