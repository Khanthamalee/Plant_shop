import 'package:firebase_shop/common/bloc/button/button_state_cubit.dart';
import 'package:firebase_shop/common/widget/button/basic_reactive_button.dart.dart';
import 'package:firebase_shop/data/order/models/order_registration_req.dart';
import 'package:firebase_shop/domain/order/usecase/order_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/helper/cart/cart.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';
import '../../home/pages/home.dart';
import 'order_placed.dart';

class CheckoutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckoutPage({super.key, required this.products});
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double subtotal = CartHelper.calculateCartSubTotal(products);
    double shippingCost = CartHelper.calculateCartShippingCost(products);
    double tex = CartHelper.calculateCartTex(subtotal);
    double total = CartHelper.calculateCartTotal(subtotal, shippingCost, tex);
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Checkout"),
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _addressField(),
            _checkoutButton(context, total),
          ],
        ),
      ),
    );
  }

  Widget _addressField() {
    return Padding(
      padding: EdgeInsets.only(left: DSW(8), right: DSW(8), top: DSH(20)),
      child: TextFormField(
        maxLines: 6,
        minLines: 2,
        controller: _addressController,
        decoration: InputDecoration(
            hintText: 'Shipping Address',
            hintStyle: TextStyle(color: AppColors.primary, fontSize: DSH(16)),
            fillColor: AppColors.backgroundsecondary),
      ),
    );
  }

  Widget _checkoutButton(BuildContext context, double total) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) => BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            // var snackbar = SnackBar(
            //   content: Center(child: Text("Order Placed successfully.")),
            //   behavior: SnackBarBehavior.floating,
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackbar);
            AppNavigator.pushAndRemove(context, OrderPlacedPage());
          }
          if (state is ButtonFailureState) {
            var snackbar = SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        child: Padding(
            padding:
                EdgeInsets.only(left: DSW(8), right: DSW(8), bottom: DSH(15)),
            child: BasicReactiveButton(
              onPressed: () {
                context.read<ButtonStateCubit>().execute(
                    usecase: OrderRegistrationUseCase(),
                    params: OrderRegistrationReq(
                        products: products,
                        createData: DateTime.now().toString(),
                        itemCount: products.length,
                        totalPrice: total,
                        shippingadress: _addressController.text));
                //Navigator.pop(context);
                //AppNavigator.push(context, OrderPlacedPage());
              },
              height: DSH(60),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${total.round()}  B",
                      style: TextStyle(
                          fontSize: DSH(16),
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400)),
                  Text("Place Order",
                      style: TextStyle(
                          fontSize: DSH(16),
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            )),
      ),
    );
  }
}
