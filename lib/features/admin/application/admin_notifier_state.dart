import 'package:feature_first/common/global/functions/global_functions.dart';
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

  Future<bool?> createBookingService({
    required int adminId,
    required int mechanicId,
    required String mechanicName,
    required String mechanicEmail
  })async{
    stateMaker(state.copyWith(isLoading: true));
    Map<String,dynamic> body = {
      "booking_id" : GlobalFunctions.generateRandomUserId(),
      "admin_id" : adminId,
      "mechanic_id" : mechanicId,
      "mechanic_name" : mechanicName,
      "mechanic_email" : mechanicEmail,
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
    bool success = false;
    await adminDomain.createBookingService(body: body).then((value)=> success = value ?? false);
    stateMaker(state.copyWith(isLoading: false));
    return success;
  }


}