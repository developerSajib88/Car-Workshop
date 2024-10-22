import 'package:feature_first/data/firebase/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';

class AuthenticationDomI extends AuthenticationDom{

  @override
  Future<UserModel?> createNewAccount({required Map<String,dynamic> body}) async =>
      await FirebaseServices.createNewAccount(body: body);

  @override
  Future<UserModel?> logInAccount({required String userType, required String email, required String password}) async =>
      await FirebaseServices.checkUserCredentials(userType: userType, email: email, password: password);

}