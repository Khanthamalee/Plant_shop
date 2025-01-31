import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shop/data/order/models/add_to_cart_req.dart';

import '../models/order_registration_req.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getcartProduct();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrders();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      print(user);
      FirebaseFirestore.instance
          .collection('user')
          .doc(user?.uid)
          .collection('Cart')
          .add(addToCartReq.toMap());
      print("Add to cart was successfully");
      return Right("Add to cart was successfully");
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<Either> getcartProduct() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user?.uid)
          .collection('Cart')
          .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }

      return Right(products);
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user?.uid)
          .collection('Cart')
          .doc(id)
          .delete();

      return Right('Product removed successfully');
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user?.uid)
          .collection('Orders')
          .add(order.toMap());

      for (var item in order.products) {
        print(item);
        await FirebaseFirestore.instance
            .collection('user')
            .doc(user?.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return Right('Order registered successfully');
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection('Orders')
          .get();

      print("returnedData ${returnedData.docs.map((e) => e.data()).toList()}");

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again");
    }
  }
}
