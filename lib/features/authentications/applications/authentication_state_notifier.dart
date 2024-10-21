import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState>{
  AuthenticationStateNotifier():super(AuthenticationState.init());

  void stateMaker(AuthenticationState newState)=> state = newState;

}