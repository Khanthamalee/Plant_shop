import 'package:flutter/material.dart';

import '../../../common/helper/cart/cart.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';

class CheckoutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckoutPage({super.key, required this.products});
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _subtotal = CartHelper.calculateCartSubTotal(products);
    double _shippingCost = CartHelper.calculateCartShippingCost(products);
    double _tex = CartHelper.calculateCartTex(_subtotal);
    double _total =
        CartHelper.calculateCartTotal(_subtotal, _shippingCost, _tex);
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Checkout"),
      ),
      bottomNavigationBar: _checkoutButton(context, _total),
      body: _addressField(),
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
    return Padding(
        padding: EdgeInsets.only(left: DSW(8), right: DSW(8), bottom: DSH(15)),
        child: BaseAppButton(
          onPressed: () {
            // AppNavigator.push(
            //     context,
            //     CheckoutPage(
            //       products: products,
            //     ));
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
        ));
  }
}
