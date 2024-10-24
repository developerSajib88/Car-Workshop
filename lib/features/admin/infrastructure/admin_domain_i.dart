import 'package:feature_first/data/firebase/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:feature_first/features/admin/domain/admin_domain.dart';

class AdminDomainI extends AdminDomain{

  @override
  Future<List<UserModel>?> getAllMechanic() async =>
      await FirebaseServices().getAllMechanic();

  @override
  Future<void> createBookingService({required Map<String, dynamic> body}) async =>
      await FirebaseServices().createBookingServices(body: body);

}