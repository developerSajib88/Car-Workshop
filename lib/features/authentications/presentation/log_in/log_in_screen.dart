import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/logo_widget.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/authentications/presentation/user_registration/user_registration_screen.dart';
import 'package:feature_first/features/dashboard/dashboard_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LogInScreen extends HookConsumerWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final toWarn = useState<bool>(false);
    final obSecurePassword = useState<bool>(false);

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);


    return Scaffold(
      body: ImageBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossCenter,
              mainAxisAlignment: mainCenter,
              children: [

                gap12,

                const LogoWidget(),

                gap12,

                Text(
                  "Welcome Back",
                  style: CustomTextStyles.titleTextStyles,
                ),

                gap4,

                Text(
                  "Log in to manage your car service bookings and account.",
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
                        passwordVisibility: obSecurePassword.value,
                        suffixIconPressed: ()=> obSecurePassword.value = !obSecurePassword.value,
                        showSuffixIcon: true,
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.password,
                            formValue: value
                        ).validate(),
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
                
                
                gap12,

                PrimaryButton(
                    isLoading: authenticationState.isLoading,
                    title: "Sign In",
                    onPressed: (){
                      toWarn.value = true;
                      if(formKey.currentState!.validate() && authenticationState.selectedUserType != null){
                        authenticationCtrl.userLogIn().then((value){
                          if(value) {Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(builder: (context) => const DashboardScreen()));
                      }
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
                      "Don’t have account?",
                      style: CustomTextStyles.primaryTextStyles,
                    ),
                    gap2,
                    InkWell(
                        onTap: ()=> Navigator.push(context,
                            CupertinoPageRoute(builder: (context)=> const UserRegistrationScreen())
                        ),
                        child: Text(
                          "Sign Up",
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
