import 'package:firebase_shop/domain/order/entity/product_ordered.dart';

abstract class CartProductDisplayState {}

class CartProductLoadding extends CartProductDisplayState {}

class CartProductLoaded extends CartProductDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductDisplayState {}
