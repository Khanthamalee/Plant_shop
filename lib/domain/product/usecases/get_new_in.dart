import 'package:dartz/dartz.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/domain/product/repository/product.dart';

import '../../../service_locator.dart';

class GetNewInUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getNewIn();
  }
}
