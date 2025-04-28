import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Repos/auth_repo.dart';

import 'package:hotel_app/features/Auth/data/models/sign_up_req_model.dart';

class SignUpUsecase extends UseCase<Either, SignUpReqModel> {
  @override
  Future<Either> call({SignUpReqModel? param}) {
    return getit.get<AuthRepo>().signUp(param!);
  }
}
