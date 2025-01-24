import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../presentation/product_detail/pages/product_detail.dart';
import '../../../responsive/dimension.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
            context, ProductDetailPage(productEntity: productEntity));
      },
      child: Container(
        height: DSH(120),
        width: DSW(55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DSH(10)),
          //shape: BoxShape.rectangle,

          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(productEntity.image[0]), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
