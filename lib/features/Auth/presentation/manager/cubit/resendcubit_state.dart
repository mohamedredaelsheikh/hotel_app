part of 'resendcubit_cubit.dart';

@immutable
sealed class ResendcubitState {}

final class ResendcubitInitial extends ResendcubitState {}

final class ResendcubitLoading extends ResendcubitState {}

final class ResendcubitFailure extends ResendcubitState {
  final String message;
  ResendcubitFailure({required this.message});
}

final class ResendcubitSeccess extends ResendcubitState {}
