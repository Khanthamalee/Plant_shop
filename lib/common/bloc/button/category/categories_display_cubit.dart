import 'package:firebase_shop/common/bloc/button/category/categories_display_state.dart';
import 'package:firebase_shop/domain/category/usecases/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesisLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold((error) {
      emit(LoadCategoryFaiLure());
    }, (data) {
      emit(CategoriesisLoaded(categories: data));
    });
  }
}
