import 'package:bloc/bloc.dart';
import 'package:hotel_app/core/utils/service_locator.dart';
import 'package:hotel_app/features/Auth/Domain/Usecases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'authlogin_state.dart';

class AuthloginCubit extends Cubit<AuthloginState> {
  AuthloginCubit() : super(AuthloginInitial());

  void appStarted() async {
    var isLoggedIn = await getit<IsLoginUsecase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
