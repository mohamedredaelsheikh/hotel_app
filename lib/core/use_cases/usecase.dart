abstract class UseCase<Type, Param> {
  Future<Type> call({Param param});
}

abstract class UseCaseTwoparam<Type, Param1, param2> {
  Future<Type> call({Param1 param1, param2 param2});
}
