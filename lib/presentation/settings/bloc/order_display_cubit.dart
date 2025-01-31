import 'package:firebase_shop/domain/order/usecase/get_order.dart';
import 'package:firebase_shop/presentation/settings/bloc/order_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class OrderDisplayCubit extends Cubit<OrderDisplayState> {
  OrderDisplayCubit() : super(OrderLoading());

  void displayOrders() async {
    var returnedData = await sl<GetOrderUseCase>().call();

    returnedData.fold((error) {
      emit(LoadOrderFailure(errorMessage: error));
    }, (orders) {
      emit(OrderLoaded(orders: orders));
    });
  }
}
