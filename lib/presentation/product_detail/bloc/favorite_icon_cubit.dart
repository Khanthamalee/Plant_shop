import 'package:firebase_shop/domain/product/entities/product.dart';
import 'package:firebase_shop/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:firebase_shop/domain/product/usecases/is_favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite(String productId) async {
    var result = await sl<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    print("onTap : $product");
    var result =
        await sl<AddOrRemoveFavoriteProductUseCase>().call(params: product);
    print("result : $result");
    result.fold((error) {
      //print(error.toString());
      emit(error);
    }, (data) {
      print(data.toString());
      emit(data);
    });
  }
}
