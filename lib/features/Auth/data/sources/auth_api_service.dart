import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/core/constants/api_urls.dart';
import 'package:hotel_app/core/errors/failure.dart';
import 'package:hotel_app/core/network/dio_client.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';

abstract class AuthApiService {
  Future<Either<Failure, SignUpReqModel>> signUp(SignUpReqModel signUpReqModel);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<Failure, SignUpReqModel>> signUp(
    SignUpReqModel signUpReqModel,
  ) async {
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
}
