import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
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
              isGreaterThanOrEqualTo: Timestamp.fromDate(
                  DateTime(2025, 1, DateTime.timestamp().day)))
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
}
