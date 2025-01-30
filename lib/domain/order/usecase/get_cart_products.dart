import 'package:dartz/dartz.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/data/order/models/product_ordered.dart';
import 'package:firebase_shop/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class GetCartProductsUsecase implements UseCase<Either, ProductOrderedModel> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getCartProducts();
  }
}
