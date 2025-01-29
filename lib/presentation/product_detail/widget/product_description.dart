import 'package:flutter/material.dart';

import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class ProductDescription extends StatelessWidget {
  final ProductEntity productEntity;
  final int page;
  const ProductDescription(
      {super.key, required this.productEntity, required this.page});

  @override
  Widget build(BuildContext context) {
   // print(productEntity.booknoModel[page].description);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Container(
        height: DSH(450),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                    productEntity.booknoModel[page].description))),
      ),
    );
  }
}
