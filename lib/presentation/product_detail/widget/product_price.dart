import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
class ProductPrice extends StatelessWidget {
  final String price;
  const ProductPrice({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _price(),
      ],
    );
  }

  Widget _price() {
    // double discountedgen =
    //     double.parse(productEntity.memberModel.general.discountedPrice);
    // double discountedvip =
    //     double.parse(productEntity.memberModel.VIP.discountedPrice);
    return Text(
      price,
      style: TextStyle(
          fontSize: DSH(16),
          fontWeight: FontWeight.w500,
          color: AppColors.textsecondary),
    );
  }
}
