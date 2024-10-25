
import 'package:feature_first/features/admin/application/admin_notifier_state.dart';
import 'package:feature_first/features/admin/application/admin_state.dart';
import 'package:feature_first/features/admin/domain/admin_domain.dart';
import 'package:feature_first/features/admin/infrastructure/admin_domain_i.dart';
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/applications/authentication_state_notifier.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:feature_first/features/authentications/infrastructure/authentication_domain_i.dart';
import 'package:feature_first/features/mechanic/application/mechanic_state.dart';
import 'package:feature_first/features/mechanic/application/mechanic_state_notifier.dart';
import 'package:feature_first/features/mechanic/mechanic_domain/mechanic_domain.dart';
import 'package:feature_first/features/mechanic/mechanic_infrastructure/mechanic_domain_i.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'dependency_injection_provider.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<AuthenticationDom>(()=> AuthenticationDomI());
  getIt.registerLazySingleton<AdminDomain>(()=> AdminDomainI());
  getIt.registerLazySingleton<MechanicDomain>(()=> MechanicDomainI());
}