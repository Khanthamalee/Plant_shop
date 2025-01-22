import 'package:dartz/dartz.dart';
import 'package:firebase_shop/data/product/source/product_firebase_service.dart';
import 'package:firebase_shop/domain/product/repository/product.dart';

import '../../../service_locator.dart';
import '../models/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedDate = await sl<ProductFirebaseService>().getTopSelling();

    return returnedDate.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getNewIn() async {
    var returnedDate = await sl<ProductFirebaseService>().getNewIn();

    return returnedDate.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedDate =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);

    return returnedDate.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
