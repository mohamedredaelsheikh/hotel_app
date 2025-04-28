import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase_with_param.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';
import 'package:hotel_app/features/Auth/data/models/sign_in_req_model.dart';

class SignInUsecase extends UseCasewithParam<Either, SignInReqModel> {
  @override
  Future<Either> call({SignInReqModel? param}) {
    return getit.get<AuthRepo>().signIn(param!);
  }
}
