import 'package:firebase_shop/domain/Auth/usecases/get_ages.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_display_state.dart';
import 'package:firebase_shop/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displaiAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold((message) {
      emit(AgesLoadFailure(message: message));
    }, (data) {
      emit(AgesLoaded(ages: data));
    });
  }
}
