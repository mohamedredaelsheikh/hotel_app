import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/features/Auth/data/models/ressetpasswordmodel.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel);
  Future<Either<Failure, dynamic>> signIn(SignInReqModel signInReqModel);
  Future<Either<Failure, dynamic>> forgetPassword(String email);
  Future<Either<Failure, dynamic>> verfiypassword(String email, String otp);
  Future<Either<Failure, dynamic>> ressetpassword(
    Ressetpasswordmodel ressetpasswordmodel,
  );

  Future<bool> isLoggedIn();
  Future<Either<Failure, dynamic>> getUser();
  Future<Either> logout();
}
