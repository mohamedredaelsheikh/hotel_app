part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class FailedToRegisterState extends AuthState {
  final String message;
  FailedToRegisterState({required this.message});
}

class ChangeValueSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class FailedToLoginState extends AuthState {
  final String message;
  FailedToLoginState({required this.message});
}
