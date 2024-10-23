import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AdminState extends Equatable{
  final bool isLoading;
  final TextEditingController titleController;
  final TextEditingController startDateTimeController;
  final TextEditingController endDateTimeController;
  final List<UserModel?>? mechanicList;

  const AdminState({
    required this.isLoading,
    required this.titleController,
    required this.startDateTimeController,
    required this.endDateTimeController,
    required this.mechanicList
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    mechanicList
  ];

  factory AdminState.init()=> AdminState(
      isLoading: false,
      titleController: TextEditingController(),
      startDateTimeController: TextEditingController(),
      endDateTimeController: TextEditingController(),
      mechanicList: [],
  );

  AdminState copyWith({
    bool? isLoading,
    TextEditingController? titleController,
    TextEditingController? startDateTimeController,
    TextEditingController? endDateTimeController,
    List<UserModel?>? mechanicList
  })=> AdminState(
      isLoading: isLoading ?? this.isLoading,
      titleController: titleController ?? this.titleController,
      startDateTimeController: startDateTimeController ?? this.startDateTimeController,
      endDateTimeController: endDateTimeController ?? this.endDateTimeController,
      mechanicList: mechanicList ?? this.mechanicList
  );

}