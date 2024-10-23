import 'package:feature_first/data/model/user_model.dart';

abstract class AdminDomain {
  Future<List<UserModel>?> getAllMechanic();
}