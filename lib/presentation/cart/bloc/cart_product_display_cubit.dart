import 'package:firebase_shop/domain/order/usecase/get_cart_products.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductLoadding());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUsecase>().call();

    returnedData.fold((error) {
      emit(LoadCartProductsFailure());
    }, (data) {
      emit(CartProductLoaded(products: data));
    });
  }
}
