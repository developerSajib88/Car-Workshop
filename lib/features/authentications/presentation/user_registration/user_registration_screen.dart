import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/logo_widget.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:feature_first/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserRegistrationScreen extends HookConsumerWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final toWarn = useState<bool>(false);
    final obsecurePassword = useState<bool>(false);
    final obsecureConfirmPassword = useState<bool>(false);

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authencationState.emailController,
                          title: "Email",
                          hintText: "demo@gmail.com",
                          validator: (value)=> FormValidation(
                              validationType: ValidationType.email,
                              formValue: value
                          ).validate(),
                        ),

                        gap8,

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authencationState.passwordController,
                          title: "Password",
                          hintText: "*******",
                          passwordVisibility: obsecurePassword.value,
                          suffixIconPressed: ()=> obsecurePassword.value = !obsecurePassword.value,
                          showSuffixIcon: true,
                          validator: (value)=> FormValidation(
                              validationType: ValidationType.password,
                              formValue: value
                          ).validate(),
                        ),

                        gap8,

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authencationState.confirmPasswordController,
                          title: "Confirm Password",
                          hintText: "*******",
                          passwordVisibility: obsecureConfirmPassword.value,
                          showSuffixIcon: true,
                          suffixIconPressed: ()=> obsecureConfirmPassword.value = !obsecureConfirmPassword.value,
                          validator: (value){
                            if(authencationState.passwordController.text != value!){
                              return "Don't match your confirm password.";
                            }else{
                              return null;
                            }
                          },
                        ),


                        gap8,

                        Row(
                          children: [
                            Text("Registration as an Admin/Mechanic", style: CustomTextStyles.primaryTextStyles),
                            Text("*", style: CustomTextStyles.primaryTextStyles.copyWith(color: ColorPalates.primaryColor)),
                          ],
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
                              child: Text(
                                  "Admin",
                                  style: TextStyle(
                                      color: authencationState.selectedUserType == null && toWarn.value ? ColorPalates.primaryColor : null
                                  ),
                              ),
                            ),

                            gap6,

                            RadioMenuButton(
                              value: "Mechanic",
                              groupValue: authencationState.selectedUserType,
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(padding0),
                              ),
                              onChanged: (value)=> authencationCtrl.selectUserType(userType: value ?? "Mechanic"),
                              child: Text(
                                  "Mechanic",
                                style: TextStyle(
                                  color: authencationState.selectedUserType == null && toWarn.value
                                      ? ColorPalates.primaryColor : null
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),



                  PrimaryButton(
                      title: "Sign Up",
                      isLoading: authencationState.isLoading,
                      onPressed: (){
                        toWarn.value = true;
                        if(formKey.currentState!.validate()){
                          authencationCtrl.createUserAccount().then((done){
                            if(done) Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
                          });
                        }
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
