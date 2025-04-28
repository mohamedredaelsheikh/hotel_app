import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await getit<AuthRepo>().logout();
  }
}
