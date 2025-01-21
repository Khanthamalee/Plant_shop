import 'package:firebase_shop/domain/product/entities/product.dart';

abstract class TopSellingDisplayState {}

class ProductisLoading extends TopSellingDisplayState {}

class ProductisLoaded extends TopSellingDisplayState {
  final List<ProductEntity> products;
  ProductisLoaded({required this.products});
}

class ProductFaiLure extends TopSellingDisplayState {}
