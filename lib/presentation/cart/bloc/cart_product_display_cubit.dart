import 'package:firebase_shop/domain/order/entity/product_ordered.dart';
import 'package:firebase_shop/domain/order/usecase/get_cart_products.dart';
import 'package:firebase_shop/domain/order/usecase/remove_cart_product.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductLoadding());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUsecase>().call();

    returnedData.fold((error) {
      emit(LoadCartProductsFailure(errorMessage: error));
    }, (data) {
      emit(CartProductLoaded(products: data));
    });
  }

  void removeCartProduct(ProductOrderedEntity product) async {
    emit(CartProductLoadding());

    var returnedData =
        await sl<RemoveCartProductUseCase>().call(params: product.id);

    returnedData.fold((error) {
      emit(LoadCartProductsFailure(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
