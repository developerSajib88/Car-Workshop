import 'package:feature_first/data/local_database/get_local_database.dart';
import 'package:feature_first/features/mechanic/application/mechanic_state.dart';
import 'package:feature_first/features/mechanic/mechanic_domain/mechanic_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MechanicStateNotifier extends StateNotifier<MechanicState>{
  final MechanicDomain mechanicDomain;
  MechanicStateNotifier({required this.mechanicDomain}):super(MechanicState.inti());

  stateMaker(MechanicState newState)=> newState = state;

  void init(){
    getMechanicBookingJobList();
  }

  Future<void> getMechanicBookingJobList()async{
    stateMaker(state.copyWith(isLoading: true));
    mechanicDomain.getMechanicBookingJobList(
        mechanicId: GetLocalDatabase().userId() ?? 0000
    ).then((value){
      if(value != null){
        stateMaker(state.copyWith(
          mechanicBookingJobList: value
        ));
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }

}