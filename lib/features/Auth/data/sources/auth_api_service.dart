import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/core/constants/api_urls.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/core/network/dio_client.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiService {
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel);
  Future<Either<Failure, dynamic>> signIn(SignInReqModel signInReqModel);
  Future<Either<Failure, dynamic>> getUser();
  Future<Either<Failure, dynamic>> forgetPassword(String email);
  Future<Either<Failure, dynamic>> verfiypassword(String email, String otp);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<Failure, dynamic>> signUp(SignUpReqModel signUpReqModel) async {
    try {
      var response = await getit.get<DioClient>().post(
        ApiUrls.signUp,
        data: signUpReqModel.toMap(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signIn(SignInReqModel signInReqModel) async {
    try {
      var response = await getit.get<DioClient>().post(
        ApiUrls.signIn,
        data: signInReqModel.toMap(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getUser() async {
    try {
      var sheredPreferences = await SharedPreferences.getInstance();
      var token = sheredPreferences.getString('token');
      var response = await getit.get<DioClient>().get(
        ApiUrls.currentUser,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgetPassword(String email) async {
    try {
      var response = await getit.get<DioClient>().post(
        ApiUrls.forgetPassword,
        data: {'email': email},
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> verfiypassword(
    String email,
    String otp,
  ) async {
    try {
      var response = await getit.get<DioClient>().post(
        ApiUrls.verfiyPassword,
        data: {'email': email, 'otp': otp},
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }
}
