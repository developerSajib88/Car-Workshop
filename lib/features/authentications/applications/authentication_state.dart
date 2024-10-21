import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends Equatable{
  final bool isLoading;
  final String? selectedUserType;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const AuthenticationState({
    required this.isLoading,
    required this.selectedUserType,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    selectedUserType,
    emailController,
    passwordController,
    confirmPasswordController
  ];


  factory AuthenticationState.init()=> AuthenticationState(
      isLoading: false,
      selectedUserType: null,
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController()
  );


  AuthenticationState copyWith({
    bool? isLoading,
    String? selectedUserType,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController
  })=> AuthenticationState(
    isLoading: isLoading ?? this.isLoading,
    selectedUserType: selectedUserType ?? this.selectedUserType,
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController,
    confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController
  );

}