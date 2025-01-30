import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../widget/cart_checkout.dart';
import '../widget/cart_ordered_detail.dart';
import '../widget/cart_ordered_image.dart';

class CartPage extends StatelessWidget {
  //final ProductOrderedEntity productOrderedEntity;
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Cart"),
      ),
      body: BlocProvider(
        create: (context) => CartProductDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
          builder: (context, state) {
            if (state is CartProductLoadding) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductLoaded) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          _height(context),
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: EdgeInsets.only(left: DSW(8), right: DSW(8)),
                        child: Container(
                          height: DSH(120),
                          color: AppColors.backgroundsecondary,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CartOrderedImage(
                                      products: state.products[index])),
                              Expanded(
                                  flex: 5,
                                  child: CartOrderedDetail(
                                      products: state.products[index]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CartCheckout(products: state.products),
                ],
              );
            }
            if (state is LoadCartProductsFailure) {
              return Center(child: Text(state.toString()));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }
}
