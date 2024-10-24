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

  void bookingStepUpdate({required int step}){
    stateMaker(
      state.copyWith(
        stepNumber: step
      )
    );
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

  Future adminBookingService({required int adminId, required int mechanicId})async{
    stateMaker(state.copyWith(isLoading: true));
    Map<String,dynamic> body = {
      "admin_id" : adminId,
      "mechanicId" : mechanicId,
      "booking_title" : state.titleController.text,
      "start_date" : state.startDateTimeController.text,
      "end_date" : state.endDateTimeController.text,
      "car_company" : state.carCompanyController.text,
      "car_model" : state.carModelController.text,
      "car_year" : state.carYearController.text,
      "registration_plates" : state.carRegPlateController.text,
      "customer_name" : state.customerNameController.text,
      "customer_phone" : state.customerPhoneController.text,
      "customer_email" : state.customerEmailController.text
    };
    await adminDomain.createBookingService(body: body);
    stateMaker(state.copyWith(isLoading: false));
  }


}