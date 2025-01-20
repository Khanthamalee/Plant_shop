import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  @override
  Future<Either> getCategories() async {
    throw UnimplementedError();
  }
}
