import 'package:firebase_shop/domain/product/entities/product.dart';

abstract class NewInDisplayState {}

class NewInisLoading extends NewInDisplayState {}

class NewInisLoaded extends NewInDisplayState {
  final List<ProductEntity> products;
  NewInisLoaded({required this.products});
}

class NewInFaiLure extends NewInDisplayState {}
