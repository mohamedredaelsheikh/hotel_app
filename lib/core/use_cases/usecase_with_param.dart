abstract class UseCasewithParam<Type, Param> {
  Future<Type> call({Param param});
}
