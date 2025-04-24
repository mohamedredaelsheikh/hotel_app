import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';

abstract class UseCaseWithParamters<Type, param> {
  Future<Either<Failure, Type>> call(param paramter);
}
