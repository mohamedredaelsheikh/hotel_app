import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/data/models/ressetpasswordmodel.dart';

class RessetPasswordUsecase extends UseCase<Either, Ressetpasswordmodel> {
  @override
  Future<Either> call({Ressetpasswordmodel? param}) {
    return getit.get<AuthRepo>().ressetpassword(param!);
  }
}
