import 'package:firebase_shop/domain/product/entities/product.dart';

abstract class ProductsDisplayState {}

class ProductsisLoading extends ProductsDisplayState {}

class ProductsisLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;
  ProductsisLoaded({required this.products});
}

class ProductsFaiLure extends ProductsDisplayState {}
