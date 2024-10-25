import 'dart:io';
import 'dart:math';

import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/common/global/validation/forms_validation.dart';
import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
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
    final obSecurePassword = useState<bool>(false);
    final obSecureConfirmPassword = useState<bool>(false);

    final pickImage = useState<File?>(null);

    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);

    Future<void> updateUserProfile()async{
      if(formKey.currentState!.validate()){
        if(pickImage.value != null){
          await authenticationCtrl.profilePictureUpload(imageFile: pickImage.value!).then((value)async{
            await authenticationCtrl.profileInfoUpdate(
                profileImageUrl: value ?? authenticationState.userModel?.profileImage ?? ImageConstants.mehanicImage
            );
          });
        }else{
          await authenticationCtrl.profileInfoUpdate(
              profileImageUrl: authenticationState.userModel?.profileImage ?? ImageConstants.mehanicImage
          );
        }
      }
    }

    useEffect((){
      Future.microtask(()=> authenticationCtrl.setUserProfileInfo());
      return null;
    },[]);

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
                      backgroundImage: pickImage.value != null ? FileImage(pickImage.value!) :
                      NetworkImage(
                        authenticationState.userModel?.profileImage ?? "",
                      )
                  ),
                ),

                WidgetBounce(
                  onPressed: ()async{
                     pickImage.value = await GlobalFunctions.pickImage();
                  },
                  child: CircleAvatar(
                    radius: 8.r,
                    backgroundColor: ColorPalates.defaultWhite,
                    child: Icon(
                        Icons.camera_enhance_rounded,
                        size: 9.sp,
                    ),
                  ),
                )

              ],
            ),

            gap8,

            Text(
              authenticationState.userModel?.name ?? "Not Given",
              style: CustomTextStyles.primaryTextStylesBold,
            ),


            Text(
              "${authenticationState.userModel?.userType} ID: ${authenticationState.userModel?.userId ?? 0000}",
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
                    hintText: "e.g,Jhon Doe",
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
                    hintText: "e.g,demo@gmail.com",
                    validator: (value)=> FormValidation(
                        validationType: ValidationType.email,
                        formValue: value
                    ).validate(),
                  ),

                  gap6,

                  PrimaryTextFormFields(
                    controller: authenticationState.phoneController,
                    title: "Phone Number",
                    hintText: "e.g,0194583292",
                    // validator: (value)=> FormValidation(
                    //     validationType: ValidationType.email,
                    //     formValue: value
                    // ).validate(),
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

                  PrimaryTextFormFields(
                    isRequired: true,
                    controller: authenticationState.confirmPasswordController,
                    title: "Confirm Password",
                    hintText: "*******",
                    passwordVisibility: obSecureConfirmPassword.value,
                    showSuffixIcon: true,
                    suffixIconPressed: ()=> obSecureConfirmPassword.value = !obSecureConfirmPassword.value,
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
                      onPressed: ()=> updateUserProfile()
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
