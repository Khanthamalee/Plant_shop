import 'package:firebase_shop/domain/Auth/usecases/get_user.dart';
import 'package:firebase_shop/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());
  void displayUserInfo() async {
    var returnedDate = await sl<GetUserUsecase>().call();
    returnedDate.fold((error) {
      emit(LoadUserInfoFailure());
    }, (data) {
      emit(UserInfoLoaded(user: data));
    });
  }
}
