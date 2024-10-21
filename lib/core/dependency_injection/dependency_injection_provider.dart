part of 'dependency_injection.dart';

/// This is my riverpod state provider
final authenticationProvider =
  StateNotifierProvider<AuthenticationStateNotifier,AuthenticationState>(
        (ref) => AuthenticationStateNotifier(authenticationDom: getIt()));