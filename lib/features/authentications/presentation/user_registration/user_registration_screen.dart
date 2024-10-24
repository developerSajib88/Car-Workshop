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
    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);

    return Scaffold(
        body: ImageBackground(
            padding: paddingH12,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: crossCenter,
                mainAxisAlignment: mainCenter,
                children: [

                  gap6,

                  const LogoWidget(),

                  gap8,

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

                  gap4,

                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [


                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authenticationState.userNameController,
                          title: "Full Name",
                          hintText: "Jhon Doe",
                          validator: (value)=> FormValidation(
                              validationType: ValidationType.name,
                              formValue: value
                          ).validate(),
                        ),

                        gap6,

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authenticationState.emailController,
                          title: "Email",
                          hintText: "demo@gmail.com",
                          validator: (value)=> FormValidation(
                              validationType: ValidationType.email,
                              formValue: value
                          ).validate(),
                        ),

                        gap6,

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authenticationState.passwordController,
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

                        gap6,

                        PrimaryTextFormFields(
                          isRequired: true,
                          controller: authenticationState.confirmPasswordController,
                          title: "Confirm Password",
                          hintText: "*******",
                          passwordVisibility: obsecureConfirmPassword.value,
                          showSuffixIcon: true,
                          suffixIconPressed: ()=> obsecureConfirmPassword.value = !obsecureConfirmPassword.value,
                          validator: (value){
                            if(authenticationState.passwordController.text != value!){
                              return "Don't match your confirm password.";
                            }else{
                              return null;
                            }
                          },
                        ),


                        gap6,

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
                              groupValue: authenticationState.selectedUserType,
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(padding0),
                              ),
                              onChanged: (value)=> authenticationCtrl.selectUserType(userType: value ?? "Admin"),
                              child: Text(
                                  "Admin",
                                  style: TextStyle(
                                      color: authenticationState.selectedUserType == null && toWarn.value ? ColorPalates.primaryColor : null
                                  ),
                              ),
                            ),

                            gap6,

                            RadioMenuButton(
                              value: "Mechanic",
                              groupValue: authenticationState.selectedUserType,
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(padding0),
                              ),
                              onChanged: (value)=> authenticationCtrl.selectUserType(userType: value ?? "Mechanic"),
                              child: Text(
                                  "Mechanic",
                                style: TextStyle(
                                  color: authenticationState.selectedUserType == null && toWarn.value
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
                      isLoading: authenticationState.isLoading,
                      onPressed: ()async{
                        toWarn.value = true;
                        if(formKey.currentState!.validate() && authenticationState.selectedUserType != null){
                          authenticationCtrl.createUserAccount().then((value){
                            if(value) Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
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
                          onTap: ()=> Navigator.pop(context),
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
