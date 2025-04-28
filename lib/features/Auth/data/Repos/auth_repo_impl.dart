import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_api_service.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel) async {
    return await getit.get<AuthApiService>().signUp(signUpReqModel);
  }
}
