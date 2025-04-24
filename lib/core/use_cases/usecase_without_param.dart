import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/errors/failure.dart';

abstract class UseCaseWithNoParamters<Type> {
  Future<Either<Failure, Type>> call();
}
