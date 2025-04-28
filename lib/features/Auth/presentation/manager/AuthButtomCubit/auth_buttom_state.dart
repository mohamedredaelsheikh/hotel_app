abstract class AuthButtomState {}

class AuthButtomInitialState extends AuthButtomState {}

class AuthButtomLoadingState extends AuthButtomState {}

class AuthButtomSuccessState extends AuthButtomState {}

class AuthButtonFailureState extends AuthButtomState {
  final String errorMessage;
  AuthButtonFailureState({required this.errorMessage});
}
