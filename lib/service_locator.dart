import 'package:firebase_shop/data/auth/repository/auth_repository_impl.dart';
import 'package:firebase_shop/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_ages.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_user.dart';
import 'package:firebase_shop/domain/Auth/usecases/is_logged_in.dart';
import 'package:firebase_shop/domain/Auth/usecases/send_password_reset_email.dart';
import 'package:firebase_shop/domain/Auth/usecases/signin.dart';
import 'package:firebase_shop/domain/Auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<SendPasswordResetEmailUsecase>(
      SendPasswordResetEmailUsecase());
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
}
