import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/domain/product/repository/product.dart';

import '../../../service_locator.dart';

class IsFavoriteUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }
}
