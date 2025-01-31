import 'package:dartz/dartz.dart';
import 'package:firebase_shop/data/product/source/product_firebase_service.dart';
import 'package:firebase_shop/domain/product/entities/product.dart';
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

  @override
  Future<Either> getProductByTitle(String title) async {
    var returnedDate =
        await sl<ProductFirebaseService>().getProductByTitle(title);

    return returnedDate.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    var returnedDate =
        await sl<ProductFirebaseService>().addOrRemoveFavoriteProduct(product);
    // print("addOrRemoveFavoriteProduct $returnedDate");
    return returnedDate.fold((error) {
      //print("error : $error");
      return Left(error);
    }, (data) {
      //print(" data in addOrRemoveFavoriteProduct  : $data");
      //print(
      //" return in addOrRemoveFavoriteProduct  : ${List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList()}");
      return Right(data);
    });
  }

  @override
  Future<bool> isFavorite(String productId) async {
    return await sl<ProductFirebaseService>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoriteProducts() async {
    var returnedDate = await sl<ProductFirebaseService>().getFavoriteProducts();

    return returnedDate.fold((error) {
      print(error);
      return Left(error);
    }, (data) {
      print(data);
      print(data.runtimeType);

      for (var item in data) {
        var product = ProductModel.fromMap(item).toEntity();
        print(product);
      }

      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
