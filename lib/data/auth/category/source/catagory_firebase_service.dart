import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CatagoryFirebaseService {
  Future<Either> getCategories();
}

class CatagoryFirebaseServiceImpl extends CatagoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection('category').get();
      var categoriesList = categories.docs.map((e) => e.data()).toList();

      print(categoriesList.toList());
      print(categoriesList.runtimeType);

      return Right(categoriesList);
    } catch (e) {
      return Left("Please try again");
    }
  }
}
