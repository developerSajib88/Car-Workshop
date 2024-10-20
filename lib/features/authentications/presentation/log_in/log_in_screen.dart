import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/logo_widget.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/features/authentications/presentation/user_registration/user_registration_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossCenter,
              mainAxisAlignment: mainCenter,
              children: [

                gap24,

                const LogoWidget(),

                gap24,

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

                gap12,

                const PrimaryTextFormFields(
                    title: "Email",
                    hintText: "demo@gmail.com"
                ),

                gap8,

                const PrimaryTextFormFields(
                    title: "Password",
                    hintText: "*******",
                    showSuffixIcon: true,
                ),

                gap16,

                PrimaryButton(
                    title: "Sign In",
                    onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> UserRegistrationScreen()))
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
                        onTap: (){},
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
