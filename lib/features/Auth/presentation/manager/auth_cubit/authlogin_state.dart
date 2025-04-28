part of 'authlogin_cubit.dart';

@immutable
sealed class AuthloginState {}

final class AuthloginInitial extends AuthloginState {}

class Authenticated extends AuthloginState {}

class UnAuthenticated extends AuthloginState {}
