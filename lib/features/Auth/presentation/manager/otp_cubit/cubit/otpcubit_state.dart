part of 'otpcubit_cubit.dart';

@immutable
sealed class OtpcubitState {}

final class OtpcubitInitial extends OtpcubitState {}

final class OtpcubitLoading extends OtpcubitState {}

final class OtpcubitFailure extends OtpcubitState {
  final String message;
  OtpcubitFailure({required this.message});
}

final class OtpcubitSuccess extends OtpcubitState {
  final String email;
  final String token;

  OtpcubitSuccess({required this.email, required this.token});
}
