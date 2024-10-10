import 'package:firebase_shop/data/auth/repository/auth_repository_impl.dart';
import 'package:firebase_shop/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
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
}
