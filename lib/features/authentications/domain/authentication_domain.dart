import 'package:feature_first/data/model/user_model.dart';

abstract class AuthenticationDom{

  Future<UserModel?> createNewAccount({required Map<String,dynamic> body});

  Future<UserModel?> logInAccount({required String userType, required String email, required String password});


}