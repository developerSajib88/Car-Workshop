import 'package:feature_first/data/firebase/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/booking_model.dart';
import 'package:feature_first/features/mechanic/mechanic_domain/mechanic_domain.dart';


class MechanicDomainI extends MechanicDomain{
  @override
  Future<List<BookingModel>?> getMechanicBookingJobList({required int mechanicId}) async =>
      await FirebaseServices.fetchMechanicBookingsJob(mechanicId: mechanicId);
}