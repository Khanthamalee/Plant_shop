import 'package:firebase_shop/domain/category/entity/category.dart';

abstract class CategoriesDisplayState {}

class CategoriesisLoading extends CategoriesDisplayState {}

class CategoriesisLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;
  CategoriesisLoaded({required this.categories});
}

class LoadCategoryFaiLure extends CategoriesDisplayState {}
