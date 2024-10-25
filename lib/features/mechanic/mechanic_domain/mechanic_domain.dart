import 'package:feature_first/data/model/booking_model.dart';

abstract class MechanicDomain {
  Future<List<BookingModel>?> getMechanicBookingJobList({required int mechanicId});
}