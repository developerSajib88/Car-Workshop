import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user_model.dart';

class AdminState extends Equatable{
  final bool isLoading;
  final List<UserModel?>? mechanicList;

  const AdminState({
    required this.isLoading,
    required this.mechanicList
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    mechanicList
  ];

  factory AdminState.init()=> const AdminState(
      isLoading: false,
      mechanicList: []
  );

  AdminState copyWith({
    bool? isLoading,
    List<UserModel?>? mechanicList
  })=> AdminState(
      isLoading: isLoading ?? this.isLoading,
      mechanicList: mechanicList ?? this.mechanicList
  );

}