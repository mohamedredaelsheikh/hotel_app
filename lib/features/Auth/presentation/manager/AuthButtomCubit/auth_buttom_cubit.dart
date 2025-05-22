import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:hotel_app/features/Auth/presentation/manager/AuthButtomCubit/auth_buttom_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthButtomCubit extends Cubit<AuthButtomState> {
  AuthButtomCubit() : super(AuthButtomInitialState());

  void excute({dynamic params, required UseCase usecase}) async {
    emit(AuthButtomLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(param: params);

      result.fold(
        (error) {
          emit(AuthButtonFailureState(errorMessage: error));
        },
        (data) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          sharedPreferences.setString("token", data['token']);
          emit(AuthButtomSuccessState());
        },
      );
    } catch (e) {
      emit(AuthButtonFailureState(errorMessage: e.toString()));
    }
  }
}
