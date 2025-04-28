import 'package:hotel_app/core/use_cases/usecase_with_param.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

class IsLoginUsecase extends UseCasewithParam<bool, dynamic> {
  @override
  Future<bool> call({param}) {
    return getit.get<AuthRepo>().isLoggedIn();
  }
}
