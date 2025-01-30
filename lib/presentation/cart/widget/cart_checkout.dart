import 'package:flutter/material.dart';

import '../../../common/helper/cart/cart.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';

class CartCheckout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const CartCheckout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double _subtotal = CartHelper.calculateCartSubTotal(products);
    double _shippingCost = CartHelper.calculateCartShippingCost(products);
    double _tex = CartHelper.calculateCartTex(_subtotal);
    double _total =
        CartHelper.calculateCartTotal(_subtotal, _shippingCost, _tex);
    return Padding(
      padding: EdgeInsets.only(
          top: (10), left: DSW(15), right: DSW(15), bottom: DSH(15)),
      child: Container(
          child: Column(
        children: [
          _height(context),
          _subtitle('Subtotal', "$_subtotal B"),
          _height(context),
          _subtitle('Shipping Cost', "$_shippingCost B"),
          _height(context),
          _subtitle('Tax', "$_tex B"),
          _height(context),
          _subtitle('Total', "${_total.round()} B"),
          _height(context),
          _height(context),
          _checkoutButton(),
        ],
      )),
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

  Widget _checkoutButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(DSH(60)),
          //backgroundColor: AppColors.secondary
        ),
        child: Text("Checkout",
            style: TextStyle(
                fontSize: DSH(16),
                color: AppColors.primary,
                fontWeight: FontWeight.w400)));
  }
}
