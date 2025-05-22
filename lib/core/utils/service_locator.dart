import 'package:get_it/get_it.dart';
import 'package:hotel_app/core/network/dio_client.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/forget_password_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/get_usercase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/log_out_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/login_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/sign_in_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/sign_up_usecase.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/verfiy_password_usecase.dart';
import 'package:hotel_app/features/Auth/data/Repos/auth_repo_impl.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_api_service.dart';
import 'package:hotel_app/features/Auth/data/sources/auth_local_service.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<DioClient>(DioClient());

  //Api service
  getit.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  // local service
  getit.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // reposImp
  getit.registerSingleton<AuthRepo>(AuthRepoImpl());

  // usecases
  getit.registerSingleton<SignUpUsecase>(SignUpUsecase());
  getit.registerSingleton<SignInUsecase>(SignInUsecase());
  getit.registerSingleton<IsLoginUsecase>(IsLoginUsecase());
  getit.registerSingleton<GetUserUseCase>(GetUserUseCase());
  getit.registerSingleton<LogoutUseCase>(LogoutUseCase());
  getit.registerSingleton<ForgetPasswordUsecase>(ForgetPasswordUsecase());
  getit.registerSingleton<VerfiyPasswordUsecase>(VerfiyPasswordUsecase());
}
