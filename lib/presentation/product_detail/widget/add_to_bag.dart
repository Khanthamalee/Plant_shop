import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class AddToBag extends StatelessWidget {
  final double price;
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity, required this.price});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: DSW(8), right: DSW(8), bottom: DSH(10)),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(DSH(60)),
            //backgroundColor: AppColors.secondary
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${price}  Baht",
                  style: TextStyle(
                      fontSize: DSH(18),
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400)),
              Text("Add to bag",
                  style: TextStyle(
                      fontSize: DSH(18),
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
