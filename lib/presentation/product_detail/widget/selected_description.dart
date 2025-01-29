import 'package:flutter/material.dart';

import '../../../common/helper/bottomsheet/app_bottom_sheet.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import 'product_description.dart';

class Selecteddescription extends StatelessWidget {
  final ProductEntity productEntity;
  final int page;
  const Selecteddescription(
      {super.key, required this.page, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(context,
            ProductDescription(productEntity: productEntity, page: page));
      },
      child: Container(
          height: DSH(60),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: DSH(16)),
          padding: EdgeInsets.only(
              top: DSH(12), bottom: DSH(12), left: DSW(12), right: DSW(12)),
          decoration: BoxDecoration(
              color: AppColors.backgroundsecondary,
              borderRadius: BorderRadius.circular(DSH(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description Book ",
                  style: TextStyle(
                    fontSize: DSH(16),
                  )),
              _widtht(context),
              Icon(
                Icons.keyboard_arrow_down,
                size: DSH(40),
              )
            ],
          )
          //],
          //),
          ),
    );
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 5);
  }
}
