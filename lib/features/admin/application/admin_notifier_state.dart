import 'package:feature_first/features/admin/application/admin_state.dart';
import 'package:feature_first/features/admin/domain/admin_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminStateNotifier extends StateNotifier<AdminState>{

  final AdminDomain adminDomain;
  AdminStateNotifier({required this.adminDomain}): super(AdminState.init());

  void stateMaker(AdminState newState)=> state = newState;

  void init(){
    getAllMechanicList();
  }

  Future getAllMechanicList()async{
   stateMaker(state.copyWith(isLoading: true));
   await adminDomain.getAllMechanic().then((value){
     if(value != null){
       stateMaker(
         state.copyWith(
           mechanicList: value
         )
       );
     }
   });
   stateMaker(state.copyWith(isLoading: false));
  }

}