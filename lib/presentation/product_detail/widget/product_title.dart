import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: DSW(8),right:DSW(8)),
      child: Column(
        children: [
          _title(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "${title}",
      style: TextStyle(
          fontSize: DSH(18),
          fontWeight: FontWeight.w500,
          color: AppColors.primary),
    );
  }
}
