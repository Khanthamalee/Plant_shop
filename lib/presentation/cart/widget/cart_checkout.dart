import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/cart/cart.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';
import '../pages/checkout.dart';

class CartCheckout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const CartCheckout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double subtotal = CartHelper.calculateCartSubTotal(products);
    double shippingCost = CartHelper.calculateCartShippingCost(products);
    double tex = CartHelper.calculateCartTex(subtotal);
    double total =
        CartHelper.calculateCartTotal(subtotal, shippingCost, tex);
    return Padding(
      padding: EdgeInsets.only(
          top: (10), left: DSW(15), right: DSW(15), bottom: DSH(15)),
      child: Column(
              children: [
      _height(context),
      _subtitle('Subtotal', "$subtotal B"),
      _height(context),
      _subtitle('Shipping Cost', "$shippingCost B"),
      _height(context),
      _subtitle('Tax', "$tex B"),
      _height(context),
      _subtitle('Total', "${total.round()} B"),
      _height(context),
      _height(context),
      _checkoutButton(context),
              ],
            ),
    );
  }

  Widget _subtitle(String title, String result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: DSH(16)),
        ),
        Text(result, style: TextStyle(fontSize: DSH(16))),
      ],
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }

  Widget _checkoutButton(BuildContext context) {
    return BaseAppButton(
      onPressed: () {
        AppNavigator.push(
            context,
            CheckoutPage(
              products: products,
            ));
      },
      title: "Checkout",
      height: DSH(60),
    );
  }
}
