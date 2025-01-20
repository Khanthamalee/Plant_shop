import 'package:firebase_shop/data/auth/category/repository/category.dart';
import 'package:firebase_shop/data/auth/category/source/catagory_firebase_service.dart';
import 'package:firebase_shop/data/auth/repository/auth_repository_impl.dart';
import 'package:firebase_shop/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_ages.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_user.dart';
import 'package:firebase_shop/domain/Auth/usecases/is_logged_in.dart';
import 'package:firebase_shop/domain/Auth/usecases/send_password_reset_email.dart';
import 'package:firebase_shop/domain/Auth/usecases/signin.dart';
import 'package:firebase_shop/domain/Auth/usecases/signup.dart';
import 'package:firebase_shop/domain/category/repository/category.dart';
import 'package:firebase_shop/domain/category/usecases/get_categories.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CatagoryFirebaseService>(CatagoryFirebaseServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<SendPasswordResetEmailUsecase>(
      SendPasswordResetEmailUsecase());
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
