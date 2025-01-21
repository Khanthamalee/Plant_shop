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
      // List returnedDate = [];
      // for (var i in data) {
      //   returnedDate.add({
      //     "image": i["image"],
      //     "productId": i["productId"],
      //     "member": {
      //       "general": {
      //         "discountedPrice": i["member"]["general"]["discountedPrice"]
      //       },
      //       "VIP": {"discountedPrice": i["member"]["VIP"]["discountedPrice"]}
      //     },
      //     "Bookno": i["Bookno"],
      //     "sellno": i["sellno"],
      //     "title": i["title"],
      //     "categoryId": i["categoryId"],
      //     "createDate": i["createDate"]
      //   });
      // }

      // print("returnedDate : ${returnedDate}");
      // print("returnedDate : ${returnedDate}");
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
