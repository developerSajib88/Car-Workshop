import 'package:feature_first/data/model/booking_model.dart';
import 'package:feature_first/data/model/user_model.dart';

abstract class AdminDomain {
  Future<List<UserModel>?> getAllMechanic();
  Future<bool?> createBookingService({required Map<String,dynamic> body});
  Future<List<BookingModel>?> getAdminBookingList({required int adminId});
}