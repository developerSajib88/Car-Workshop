import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/booking_model.dart';

class MechanicState extends Equatable{
  final bool isLoading;
  final List<BookingModel>? mechanicBookingJobList;

  const MechanicState({
    required this.isLoading,
    required this.mechanicBookingJobList
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    mechanicBookingJobList
  ];

  factory MechanicState.inti()=> const MechanicState(
      isLoading: false,
      mechanicBookingJobList: null
  );

  MechanicState copyWith({
     bool? isLoading,
     List<BookingModel>? mechanicBookingJobList
  })=> MechanicState(
      isLoading: isLoading ?? this.isLoading,
      mechanicBookingJobList: mechanicBookingJobList ?? this.mechanicBookingJobList
  );


}