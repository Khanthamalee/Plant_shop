import 'package:firebase_shop/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

import '../../../responsive/dimension.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: DSW(180),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(productEntity.image[index])),
              ),
            );
          },
          separatorBuilder: (context, index) => _widtht(context),
          itemCount: productEntity.image.length),
    );
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 15);
  }
}
