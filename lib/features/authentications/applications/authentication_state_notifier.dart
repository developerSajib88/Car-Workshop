import 'dart:io';

import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/local_database/get_local_database.dart';
import 'package:feature_first/data/local_database/set_local_database.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState>{

  final AuthenticationDom authenticationDom;
  AuthenticationStateNotifier({required this.authenticationDom}):super(AuthenticationState.init());

  void stateMaker(AuthenticationState newState)=> state = newState;

  void init(){
    setUserData();
  }


  void selectUserType({required String userType}){
    stateMaker(state.copyWith(
      selectedUserType: userType
    ));
  }

  void setUserData(){
    stateMaker(
      state.copyWith(
        userModel: UserModel(
            profileImage: GetLocalDatabase().userProfileImage() ?? "https://img.freepik.com/free-photo/smiling-auto-mechanic-with-wrench-standing-hands-folded-white-background_662251-2939.jpg",
            userId: GetLocalDatabase().userId() ?? 12348,
            userType: GetLocalDatabase().userType() ?? "",
            name: GetLocalDatabase().userName() ?? "",
            email: GetLocalDatabase().userEmail() ?? "",
            password: GetLocalDatabase().userPass() ?? "123456"
        ),
      )
    );
  }


  Future<String?> profilePictureUpload({required File imageFile})async{
    stateMaker(state.copyWith(isLoading: true));
    return await authenticationDom.profilePictureUpload(imageFile: imageFile);
  }

  Future<void> profileInfoUpdate({required String profileImageUrl})async{
    stateMaker(state.copyWith(isLoading: true));
    Map<String,dynamic> body = {
      "profile" : profileImageUrl,
      "user_id" : state.userModel?.userId,
      "user_type" : state.userModel?.userType ?? "Admin",
      "name": state.userNameController.text,
      "email": state.emailController.text,
      "phone": state.phoneController.text,
      "password" : state.passwordController.text
    };
    await authenticationDom.updateUserProfileInfo(
        userId: state.userModel?.userId ?? 0000,
        collections: state.userModel?.userType == "Admin" ?
        FirebaseCollections.admin : FirebaseCollections.mechanic,
        updatedData: body
    ).then((value){
      if(value != null){
        SetLocalDatabase().userIsLogin(true);
        SetLocalDatabase().userId(value.userId ?? 0000);
        SetLocalDatabase().userName(value.name ?? "Not Given");
        SetLocalDatabase().userEmail(value.email ?? "Not Given");
        SetLocalDatabase().userType(value.userType ?? "Admin");
        SetLocalDatabase().userPassword(value.password ?? "123456");
        SetLocalDatabase().userProfilePicture(value.profileImage ?? "");
        stateMaker(state.copyWith(
            userModel: value
        ));
        setUserData();
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }


  void setUserProfileInfo(){
    stateMaker(
        state.copyWith(
          userNameController: TextEditingController(text: state.userModel?.name),
          emailController: TextEditingController(text: state.userModel?.email),
          passwordController: TextEditingController(text: state.userModel?.password),
          confirmPasswordController: TextEditingController(text: state.userModel?.password),
        )
    );
  }

  Future<bool> userLogIn()async{
    stateMaker(state.copyWith(isLoading: true));
    bool authSuccess = false;
    await authenticationDom.logInAccount(
        userType: state.selectedUserType ?? "Admin",
        email: state.emailController.text,
        password: state.passwordController.text
    ).then((value){
      if(value != null){
        SetLocalDatabase().userIsLogin(true);
        SetLocalDatabase().userId(value.userId ?? 0000);
        SetLocalDatabase().userName(value.name ?? "Not Given");
        SetLocalDatabase().userEmail(value.email ?? "Not Given");
        SetLocalDatabase().userType(value.userType ?? "Admin");
        SetLocalDatabase().userPassword(value.password ?? "123456");
        SetLocalDatabase().userProfilePicture(value.profileImage ??
            "https://img.freepik.com/free-photo/smiling-auto-mechanic-with-wrench-standing-hands-folded-white-background_662251-2939.jpg");
        authSuccess = true;
      }
    });
    stateMaker(state.copyWith(isLoading: false));
    return authSuccess;
  }


  Future<bool> createUserAccount()async{
    stateMaker(state.copyWith(isLoading: true));
    bool authSuccess = false;
    Map<String,dynamic> body = {
      "profile" : "https://img.freepik.com/free-photo/smiling-auto-mechanic-with-wrench-standing-hands-folded-white-background_662251-2939.jpg",
      "user_id" : GlobalFunctions.generateRandomUserId(),
      "user_type" : state.selectedUserType ?? "Admin",
      "name": state.userNameController.text,
      "email": state.emailController.text,
      "password" : state.passwordController.text
    };

    await authenticationDom.createNewAccount(
        collection: state.selectedUserType == "Admin" ? FirebaseCollections.admin
            : FirebaseCollections.mechanic,
        body: body
    ).then((value){
      if(value != null){
        SetLocalDatabase().userIsLogin(true);
        SetLocalDatabase().userId(value.userId ?? 0000);
        SetLocalDatabase().userName(value.name ?? "Not Given");
        SetLocalDatabase().userEmail(value.email ?? "Not Given");
        SetLocalDatabase().userType(value.userType ?? "Admin");
        SetLocalDatabase().userPassword(value.password ?? "123456");
        SetLocalDatabase().userProfilePicture(value.profileImage ?? "");
        authSuccess = true;
      }
    });
    stateMaker(state.copyWith(isLoading: false));
    return authSuccess;
  }

}