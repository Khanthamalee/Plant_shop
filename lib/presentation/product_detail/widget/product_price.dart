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
    return Padding(
      padding: EdgeInsets.only(left: DSW(8),right:DSW(8)),
      child: Column(
        children: [
          _price(),
        ],
      ),
    );
  }

  Widget _price() {
    return Text(
      price,
      style: TextStyle(
          fontSize: DSH(16),
          fontWeight: FontWeight.w500,
          color: AppColors.textsecondary),
    );
  }
}
