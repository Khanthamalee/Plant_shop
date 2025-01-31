import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shop/data/product/models/product.dart';

import '../../../domain/product/entities/product.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProducts();
}

class ProductFirebaseserviceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('products')
          .where('sellno', isGreaterThanOrEqualTo: 100)
          .get();
      print(
          "returnedData.docs.map((e) => e.data()) :${returnedData.docs.map((e) => e.data())}");
      print(returnedData.docs.map((e) => e.data()).runtimeType);
      return Right(returnedData.docs.map((e) => e.data()));
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('products')
          .where('createDate',
              isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(
                  DateTime.timestamp().year,
                  DateTime.timestamp().month - 1,
                  DateTime.timestamp().day)))
          .get();
      print(
          "returnedData.docs.map((e) => e.data()) :${returnedData.docs.map((e) => e.data())}");
      print(returnedData.docs.map((e) => e.data()).runtimeType);
      return Right(returnedData.docs.map((e) => e.data()));
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      print(
          "returnedData.docs.map((e) => e.data()) :${returnedData.docs.map((e) => e.data())}");
      print(returnedData.docs.map((e) => e.data()).runtimeType);
      return Right(returnedData.docs.map((e) => e.data()));
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    try {
      print("title : ${title.toLowerCase()}");

      var data = await FirebaseFirestore.instance.collection('products').get();
      var dataList = data.docs.map((e) => e.data()).toList();
      List<Map<String, dynamic>> returnedData = [];
      for (var i in dataList) {
        if (i["title"].toLowerCase().contains(title.toLowerCase().trim())) {
          var querydata = await FirebaseFirestore.instance
              .collection('products')
              .where('title', isEqualTo: i["title"])
              .get();
          var querydatamap = querydata.docs.map((e) => e.data());
          print(querydata);
          returnedData.addAll(querydatamap.toList());
        }
      }
      // var returned = await FirebaseFirestore.instance
      //     .collection('products')
      //     .where('title', isGreaterThanOrEqualTo: title)
      //     .get();
      // var returnedD = returned.docs.map((e) => e.data());
      //var ireturnedData = returnedData.iterator;

      print("returnedData.docs.map((e) => e.data()) :${returnedData}");
      print(returnedData.runtimeType);
      return Right(returnedData);
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      print(product.memberModel.VIP);
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId.padLeft(19))
          .get();

      print(
          "product.productId addOrRemoveFavoriteProduct : ${product.productId}");
      print("products.docs ${products.docs}");

      if (products.docs.isNotEmpty) {
        products.docs.first.reference.delete();
        return Right(false);
      } else {
        print("products.docs.isEmpty");
        print(product.fromEntity().toMap());
        await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .collection('Favorites')
            .add(product.fromEntity().toMap());
        return Right(true);
      }
    } catch (e) {
      return Left("Please try again because ${e.toString()} ");
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isEmpty) {
        products.docs.first.reference.delete();
        return true;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection('Favorites')
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again");
    }
  }
}
