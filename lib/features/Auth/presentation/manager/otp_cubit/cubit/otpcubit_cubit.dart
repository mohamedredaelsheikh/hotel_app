import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/use_cases/usecase.dart';
import 'package:meta/meta.dart';

part 'otpcubit_state.dart';

class OtpcubitCubit extends Cubit<OtpcubitState> {
  OtpcubitCubit() : super(OtpcubitInitial());

  void excute({
    String? param1,
    String? param2,
    required UseCaseTwoparam usecase,
  }) async {
    emit(OtpcubitLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(param1: param1, param2: param2);

      result.fold(
        (error) {
          emit(OtpcubitFailure(message: error));
        },
        (data) {
          emit(OtpcubitSuccess());
        },
      );
    } catch (e) {
      emit(OtpcubitFailure(message: e.toString()));
    }
  }
}
