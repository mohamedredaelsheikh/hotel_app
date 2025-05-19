import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/user_model.dart';
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
        return Left(ServerFailure(errormessage: error));
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

  @override
  Future<Either<Failure, dynamic>> getUser() async {
    var result = await getit.get<AuthApiService>().getUser();

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var userModel = UserModel.fromMap(data);
        var userEntity = userModel.toEntity();
        return Right(userEntity);
      },
    );
  }

  @override
  Future<Either> logout() async {
    return await getit<AuthLocalService>().logout();
  }

  @override
  Future<Either<Failure, dynamic>> forgetPassword(String email) async {
    var result = await getit.get<AuthApiService>().forgetPassword(email);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
