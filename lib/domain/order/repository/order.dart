import 'package:dartz/dartz.dart';
import 'package:firebase_shop/data/order/models/add_to_cart_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartReq addToCarReq);
}
