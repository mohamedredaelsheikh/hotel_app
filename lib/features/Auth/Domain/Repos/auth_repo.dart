import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel);
  Future<Either<Failure, dynamic>> signIn(SignInReqModel signInReqModel);
}
