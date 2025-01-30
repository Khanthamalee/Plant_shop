import 'package:dartz/dartz.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class RemoveCartProductUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }
}
