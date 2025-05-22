import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

class VerfiyPasswordUsecase extends UseCaseTwoparam<Either, String, String> {
  @override
  Future<Either> call({String? param1, String? param2}) {
    return getit.get<AuthRepo>().verfiypassword(param1!, param2!);
  }
}
