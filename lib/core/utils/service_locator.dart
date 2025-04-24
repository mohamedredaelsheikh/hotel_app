import 'package:get_it/get_it.dart';
import 'package:hotel_app/core/network/dio_client.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/sign_up_usecase.dart';
import 'package:hotel_app/features/Auth/data/Repos/auth_repo_impl.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_api_service.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<DioClient>(DioClient());

  //Api service
  getit.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // reposImp
  getit.registerSingleton<AuthRepo>(AuthRepoImpl());

  // usecases
  getit.registerSingleton<SignUpUsecase>(SignUpUsecase());
}
