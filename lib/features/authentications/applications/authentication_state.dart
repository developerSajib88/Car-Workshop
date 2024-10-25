import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends Equatable{
  final bool isLoading;
  final String? selectedUserType;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final UserModel? userModel;

  const AuthenticationState({
    required this.isLoading,
    required this.selectedUserType,
    required this.userNameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.userModel
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    selectedUserType,
    userNameController,
    phoneController,
    emailController,
    passwordController,
    confirmPasswordController,
    userModel
  ];


  factory AuthenticationState.init()=> AuthenticationState(
      isLoading: false,
      selectedUserType: null,
      userNameController: TextEditingController(),
      emailController: TextEditingController(),
      phoneController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      userModel: null
  );


  AuthenticationState copyWith({
    bool? isLoading,
    String? selectedUserType,
    TextEditingController? userNameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    UserModel? userModel
  })=> AuthenticationState(
    isLoading: isLoading ?? this.isLoading,
    selectedUserType: selectedUserType ?? this.selectedUserType,
    userNameController: userNameController ?? this.userNameController,
    phoneController: phoneController ?? this.phoneController,
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController,
    confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
    userModel: userModel ?? this.userModel
  );

}