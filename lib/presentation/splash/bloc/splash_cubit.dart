import 'package:firebase_shop/domain/Auth/usecases/is_logged_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service_locator.dart';
import 'splash_state.dart';

class Splashcubit extends Cubit<Splashstate> {
  Splashcubit() : super(DisplaySplash());
  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedIn>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
