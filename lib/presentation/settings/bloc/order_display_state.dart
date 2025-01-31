import 'package:firebase_shop/domain/order/entity/order.dart';

abstract class OrderDisplayState {}

class OrderLoading extends OrderDisplayState {}

class OrderLoaded extends OrderDisplayState {
  final List<OrderEntity> orders;

  OrderLoaded({required this.orders});
}

class LoadOrderFailure extends OrderDisplayState {
  final String errorMessage;

  LoadOrderFailure({required this.errorMessage});
}
