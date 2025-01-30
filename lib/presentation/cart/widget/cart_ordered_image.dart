import 'package:flutter/material.dart';

import '../../../domain/order/entity/product_ordered.dart';

class CartOrderedImage extends StatelessWidget {
  final ProductOrderedEntity products;
  const CartOrderedImage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(DSH(10)),
        //shape: BoxShape.rectangle,

        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(products.productImage), fit: BoxFit.fill),
      ),
    );
  }
}
