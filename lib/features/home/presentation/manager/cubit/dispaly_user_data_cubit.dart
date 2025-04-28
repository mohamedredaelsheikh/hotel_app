import 'package:bloc/bloc.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Entities/user_entity.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/get_usercase.dart';
import 'package:meta/meta.dart';

part 'dispaly_user_data_state.dart';

class DispalyUserDataCubit extends Cubit<DispalyUserDataState> {
  DispalyUserDataCubit() : super(DispalyUserDataInitial());
  void displayUser() async {
    var result = await getit<GetUserUseCase>().call();
    result.fold(
      (error) {
        emit(DispalyUserDataFailure(errormessage: error));
      },
      (data) {
        emit(DispalyUserDataLoaded(userEntity: data));
      },
    );
  }
}
