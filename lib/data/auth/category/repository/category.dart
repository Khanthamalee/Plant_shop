import 'package:dartz/dartz.dart';
import 'package:firebase_shop/domain/category/repository/category.dart';

import '../../../../service_locator.dart';
import '../models/category.dart';
import '../source/catagory_firebase_service.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CatagoryFirebaseService>().getCategories();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      print("data in CategoryRepository : $data");
      print("data in CategoryRepository : ${data.runtimeType}");
      var categoriesMap = List.from(data)
          .map((e) => CategoryModel.fromMap(e).toEntity())
          .toList();
      print(categoriesMap);
      return Right(List.from(data)
          .map((e) => CategoryModel.fromMap(e).toEntity())
          .toList());
      // return Right(CategoryModel.fromJson(data).toEntity());
    });
  }
}
