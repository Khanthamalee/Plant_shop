import 'package:firebase_shop/common/bloc/product/product_display_state.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase usecase;
  ProductsDisplayCubit({required this.usecase}) : super(ProductsInitailState());

  void displayProducts({dynamic params}) async {
    emit(ProductsisLoading());
    var returnedDate = await usecase.call(params: params);
    returnedDate.fold((error) {
      emit(ProductsFaiLure());
    }, (data) {
      print("data in ProductsDisplayCubit : ${data}");
      emit(ProductsisLoaded(products: data));
    });
  }

  void diaplayInitial() {
    emit(ProductsInitailState());
  }
}
