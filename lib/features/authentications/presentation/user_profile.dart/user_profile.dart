import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/text_form_fields/primary_text_form_fields.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserProfile extends HookConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final obsecurePassword = useState<bool>(false);
    final obsecureConfirmPassword = useState<bool>(false);

    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);

    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: padding6,
      child: SingleChildScrollView(
        child: Column(
          children: [


            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 31.5.r,
                  backgroundColor: ColorPalates.primaryColor,
                  child: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: const NetworkImage(
                        "https://img.freepik.com/free-photo/smiling-auto-mechanic-with-wrench-standing-hands-folded-white-background_662251-2939.jpg",
                      )
                  ),
                ),

                CircleAvatar(
                  radius: 8.r,
                  backgroundColor: ColorPalates.defaultWhite,
                  child: Icon(
                      Icons.camera_enhance_rounded,
                      size: 9.sp,
                  ),
                )

              ],
            ),

            gap8,

            Text(
              "Sajib Hasan",
              style: CustomTextStyles.primaryTextStylesBold,
            ),


            Text(
              "ID: 593493",
              style: CustomTextStyles.descriptionTextStyles,
            ),


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
                    controller: authenticationState.emailController,
                    title: "Phone Number",
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

                  gap12,


                  PrimaryButton(
                      title: "Update",
                      isLoading: authenticationState.isLoading,
                      onPressed: ()async{
                        if(formKey.currentState!.validate() && authenticationState.selectedUserType != null){
                          authenticationCtrl.createUserAccount().then((value){
                            //if(value) Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
                          });
                        }
                      }
                  ),

                  gap24,

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
