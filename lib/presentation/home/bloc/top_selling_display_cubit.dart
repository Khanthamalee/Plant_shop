import 'package:firebase_shop/domain/product/usecases/get_top_selling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';
import 'top_selling_display_state.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(ProductisLoading());

  void displayTopSelling() async {
    var returnedDate = await sl<GetTopSellingUseCase>().call();
    returnedDate.fold((error) {
      emit(ProductFaiLure());
    }, (data) {
      print("data in UserInfoDisplayCubit : ${data}");
      emit(ProductisLoaded(products: data));
    });
  }
}
