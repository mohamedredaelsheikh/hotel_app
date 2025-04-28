part of 'dispaly_user_data_cubit.dart';

@immutable
sealed class DispalyUserDataState {}

final class DispalyUserDataInitial extends DispalyUserDataState {}

final class DispalyUserDataLoading extends DispalyUserDataState {}

final class DispalyUserDataLoaded extends DispalyUserDataState {
  final UserEntity userEntity;

  DispalyUserDataLoaded({required this.userEntity});
}

final class DispalyUserDataFailure extends DispalyUserDataState {
  final String errormessage;
  DispalyUserDataFailure({required this.errormessage});
}
