import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends Equatable{
  final String? selectedUserType;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const AuthenticationState({
    required this.selectedUserType,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];


  factory AuthenticationState.init()=> AuthenticationState(
      selectedUserType: null,
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController()
  );


  AuthenticationState copyWith({
    String? selectedUserType,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController
  })=> AuthenticationState(
    selectedUserType: selectedUserType ?? this.selectedUserType,
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController,
    confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController
  );

}