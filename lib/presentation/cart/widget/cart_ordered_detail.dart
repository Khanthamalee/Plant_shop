import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';

class CartOrderedDetail extends StatelessWidget {
  final ProductOrderedEntity products;
  const CartOrderedDetail({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: DSH(15), left: DSW(5), right: DSW(5), bottom: DSH(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: DSW(95),
              child: Text(
                "${products.productTitle}",
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 15, color: AppColors.textsecondary),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _textdetail("${products.productlanguage}, "),
                //_widtht(context),
                _textdetail("Quantity : ${products.productQauntity}, "),
                // _widtht(context),
                _textdetail("price : ${products.productPrice} B "),
                // _widtht(context),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${products.totalPrice} B",
            ),
            _removedIcon(context, products),
          ],
        ),
      ]),
    );
  }

  Widget _textdetail(String text) {
    return Text(
      "$text",
      style: TextStyle(fontSize: 12),
    );
  }

  Widget _removedIcon(
      BuildContext context, ProductOrderedEntity productOrderEntity) {
    return IconButton(
      onPressed: () {
        //print("increment");
        context
            .read<CartProductDisplayCubit>()
            .removeCartProduct(productOrderEntity);
      },
      padding: EdgeInsets.all(0),
      icon: Container(
        height: DSH(40),
        width: DSW(20),
        //color: AppColors.primary,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.secondary),
        child: Icon(
          Icons.remove,
          size: DSH(20),
          color: Colors.white,
        ),
      ),
    );
  }
}
