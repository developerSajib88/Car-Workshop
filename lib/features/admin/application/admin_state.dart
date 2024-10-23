import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AdminState extends Equatable{
  final bool isLoading;
  final int stepNumber;
  final TextEditingController titleController;
  final TextEditingController startDateTimeController;
  final TextEditingController endDateTimeController;
  final TextEditingController carCompanyController;
  final TextEditingController carModelController;
  final TextEditingController carYearController;
  final TextEditingController carRegPlateController;
  final List<UserModel?>? mechanicList;

  const AdminState({
    required this.isLoading,
    required this.stepNumber,
    required this.titleController,
    required this.startDateTimeController,
    required this.endDateTimeController,
    required this.carCompanyController,
    required this.carModelController,
    required this.carYearController,
    required this.carRegPlateController,
    required this.mechanicList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    stepNumber,
    mechanicList,
    carCompanyController,
    carModelController,
    carYearController,
    carRegPlateController,
    mechanicList,
  ];

  factory AdminState.init()=> AdminState(
      isLoading: false,
      stepNumber: 0,
      titleController: TextEditingController(),
      startDateTimeController: TextEditingController(),
      endDateTimeController: TextEditingController(),
      carCompanyController: TextEditingController(),
      carModelController: TextEditingController(),
      carYearController: TextEditingController(),
      carRegPlateController: TextEditingController(),
      mechanicList: null,
  );

  AdminState copyWith({
    bool? isLoading,
    int? stepNumber,
    TextEditingController? titleController,
    TextEditingController? startDateTimeController,
    TextEditingController? endDateTimeController,
    TextEditingController? carCompanyController,
    TextEditingController? carModelController,
    TextEditingController? carYearController,
    TextEditingController? carRegPlateController,
    List<UserModel?>? mechanicList
  })=> AdminState(
      isLoading: isLoading ?? this.isLoading,
      stepNumber: stepNumber ?? this.stepNumber,
      titleController: titleController ?? this.titleController,
      startDateTimeController: startDateTimeController ?? this.startDateTimeController,
      endDateTimeController: endDateTimeController ?? this.endDateTimeController,
      carCompanyController: carCompanyController ?? this.carCompanyController,
      carModelController: carModelController ?? this.carModelController,
      carYearController: carYearController ?? this.carYearController,
      carRegPlateController: carRegPlateController ?? this.carRegPlateController,
      mechanicList: mechanicList ?? this.mechanicList
  );

}