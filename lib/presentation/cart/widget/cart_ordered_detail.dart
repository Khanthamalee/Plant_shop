import 'package:flutter/material.dart';

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
          top: DSH(15), left: DSW(8), right: DSW(8), bottom: DSH(15)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
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
            Text(
              "${products.totalPrice} B",
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${products.productlanguage}, "),
            _widtht(context),
            Text("Quantity : ${products.productQauntity}"),
            _widtht(context),
            Text("price : ${products.productPrice} B"),
          ],
        ),
      ]),
    );
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 15);
  }
}
