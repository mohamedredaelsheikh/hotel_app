import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

class ForgetPasswordUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? param}) {
    return getit.get<AuthRepo>().forgetPassword(param!);
  }
}
