import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

class IsLoginUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({param}) {
    return getit.get<AuthRepo>().isLoggedIn();
  }
}
