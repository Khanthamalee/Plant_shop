import 'package:firebase_shop/domain/product/usecases/get_new_in.dart';
import 'package:firebase_shop/presentation/home/bloc/new_in_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class NewInDisplayCubit extends Cubit<NewInDisplayState> {
  NewInDisplayCubit() : super(NewInisLoading());

  void displayNewIn() async {
    var returnedDate = await sl<GetNewInUseCase>().call();
    returnedDate.fold((error) {
      emit(NewInFaiLure());
    }, (data) {
      print("data in UserInfoDisplayCubit : ${data}");
      emit(NewInisLoaded(products: data));
    });
  }
}
