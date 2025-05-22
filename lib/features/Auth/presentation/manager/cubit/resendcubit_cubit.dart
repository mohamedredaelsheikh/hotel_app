import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:meta/meta.dart';

part 'resendcubit_state.dart';

class ResendcubitCubit extends Cubit<ResendcubitState> {
  ResendcubitCubit() : super(ResendcubitInitial());
  void excute({dynamic params, required UseCase usecase}) async {
    emit(ResendcubitLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(param: params);
      result.fold(
        (error) {
          emit(ResendcubitFailure(message: error));
        },
        (data) {
          emit(ResendcubitSeccess());
        },
      );
    } catch (e) {
      emit(ResendcubitFailure(message: e.toString()));
    }
  }
}
