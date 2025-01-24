import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(),
      ],
    );
  }
  Widget _title() {
    return Text(
      "Edible and the wild plants Book",
      style: TextStyle(
          fontSize: DSH(20),
          fontWeight: FontWeight.w500,
          color: AppColors.primary),
    );
  }

  
}
