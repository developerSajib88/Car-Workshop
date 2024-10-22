import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/local_database/set_local_database.dart';
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState>{

  final AuthenticationDom authenticationDom;
  AuthenticationStateNotifier({required this.authenticationDom}):super(AuthenticationState.init());

  void stateMaker(AuthenticationState newState)=> state = newState;


  void selectUserType({required String userType}){
    stateMaker(state.copyWith(
      selectedUserType: userType
    ));
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
        SetLocalDatabase().userName(value.name);
        SetLocalDatabase().userEmail(value.email);
        SetLocalDatabase().userType(value.userType);
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
      "user_id" : GlobalFunctions.generateRandomUserId(),
      "user_type" : state.selectedUserType ?? "Admin",
      "name": "Sajib Hasan",
      "email": state.emailController.text,
      "password" : state.passwordController.text
    };

    await authenticationDom.createNewAccount(
        collection: state.selectedUserType == "Admin" ? FirebaseCollections.admin
            : FirebaseCollections.mechanic,
        body: body
    ).then((value){
      if(value != null){
        SetLocalDatabase().userName(value.name);
        SetLocalDatabase().userEmail(value.email);
        SetLocalDatabase().userType(value.userType);
        authSuccess = true;
      }
    });
    stateMaker(state.copyWith(isLoading: false));
    return authSuccess;
  }

}