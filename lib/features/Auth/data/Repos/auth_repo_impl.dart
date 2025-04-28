import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_api_service.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel) async {
    return await getit.get<AuthApiService>().signUp(signUpReqModel);
  }

  @override
  Future<Either<Failure, dynamic>> signIn(SignInReqModel signInReqModel) async {
    Either result = await getit.get<AuthApiService>().signIn(signInReqModel);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Map<String, dynamic> response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response['token']);
        return Right(response);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() {
    return getit.get<AuthLocalService>().isLoggedIn();
  }
}
