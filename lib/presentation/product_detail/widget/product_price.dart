import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _price(),
      ],
    );
  }

  Widget _price() {
    return Text(
      "Baht 4,999 ",
      style: TextStyle(
          fontSize: DSH(16),
          fontWeight: FontWeight.w500,
          color: AppColors.textsecondary),
    );
  }
}
