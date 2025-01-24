import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import '../widget/product_images.dart';
import '../widget/product_price.dart';
import '../widget/product_title.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              _height(context),
              ProductTitle(productEntity: productEntity),
              _height(context),
              ProductPrice(productEntity: productEntity)
            ],
          ),
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }
}
