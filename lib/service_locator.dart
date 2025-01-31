import 'package:firebase_shop/data/auth/category/repository/category.dart';
import 'package:firebase_shop/data/auth/category/source/catagory_firebase_service.dart';
import 'package:firebase_shop/data/auth/repository/auth_repository_impl.dart';
import 'package:firebase_shop/data/auth/source/auth_firebase_service.dart';
import 'package:firebase_shop/data/order/repository/order.dart';
import 'package:firebase_shop/data/order/source/order_firebase_service.dart';
import 'package:firebase_shop/data/product/repository/product.dart';
import 'package:firebase_shop/data/product/source/product_firebase_service.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_ages.dart';
import 'package:firebase_shop/domain/Auth/usecases/get_user.dart';
import 'package:firebase_shop/domain/Auth/usecases/is_logged_in.dart';
import 'package:firebase_shop/domain/Auth/usecases/send_password_reset_email.dart';
import 'package:firebase_shop/domain/Auth/usecases/signin.dart';
import 'package:firebase_shop/domain/Auth/usecases/signup.dart';
import 'package:firebase_shop/domain/category/repository/category.dart';
import 'package:firebase_shop/domain/category/usecases/get_categories.dart';
import 'package:firebase_shop/domain/order/repository/order.dart';
import 'package:firebase_shop/domain/order/usecase/add_to_cart.dart';
import 'package:firebase_shop/domain/order/usecase/get_cart_products.dart';
import 'package:firebase_shop/domain/order/usecase/order_registration.dart';
import 'package:firebase_shop/domain/order/usecase/remove_cart_product.dart';
import 'package:firebase_shop/domain/product/repository/product.dart';
import 'package:firebase_shop/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:firebase_shop/domain/product/usecases/get_favorite.dart';
import 'package:firebase_shop/domain/product/usecases/get_new_in.dart';
import 'package:firebase_shop/domain/product/usecases/get_products_by_categoryId.dart';
import 'package:firebase_shop/domain/product/usecases/get_products_by_title.dart';
import 'package:firebase_shop/domain/product/usecases/get_top_selling.dart';
import 'package:firebase_shop/domain/product/usecases/is_favorite.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CatagoryFirebaseService>(CatagoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseserviceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<SendPasswordResetEmailUsecase>(
      SendPasswordResetEmailUsecase());
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductsByCategoryidUseCase>(
      GetProductsByCategoryidUseCase());
  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductsUsecase>(GetCartProductsUsecase());
  sl.registerSingleton<RemoveCartProductUseCase>(RemoveCartProductUseCase());
  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
      AddOrRemoveFavoriteProductUseCase());
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
  sl.registerSingleton<GetFavoriteUseCase>(GetFavoriteUseCase());
}
