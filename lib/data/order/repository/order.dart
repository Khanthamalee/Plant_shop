import 'package:dartz/dartz.dart';
import 'package:firebase_shop/data/order/models/add_to_cart_req.dart';
import 'package:firebase_shop/data/order/models/order_registration_req.dart';
import 'package:firebase_shop/data/order/models/product_ordered.dart';
import 'package:firebase_shop/data/order/source/order_firebase_service.dart';
import 'package:firebase_shop/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) {
    return sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedDate = await sl<OrderFirebaseService>().getcartProduct();

    return returnedDate.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedDate = await sl<OrderFirebaseService>().removeCartProduct(id);

    return returnedDate.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnedDate =
        await sl<OrderFirebaseService>().orderRegistration(order);

    return returnedDate.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }
}
