part of 'dependency_injection.dart';

/// This is my riverpod state provider
final authenticationProvider =
  StateNotifierProvider<AuthenticationStateNotifier,AuthenticationState>(
        (ref) => AuthenticationStateNotifier(authenticationDom: getIt())..init());

final adminProvider =
  StateNotifierProvider<AdminStateNotifier,AdminState>(
          (ref) => AdminStateNotifier(adminDomain: getIt())..init());