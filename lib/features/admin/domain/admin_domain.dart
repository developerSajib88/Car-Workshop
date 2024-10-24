import 'package:feature_first/data/model/user_model.dart';

abstract class AdminDomain {
  Future<List<UserModel>?> getAllMechanic();
  Future<bool?> createBookingService({required Map<String,dynamic> body});
}