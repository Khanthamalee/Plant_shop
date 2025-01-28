import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class SynopsisBook extends StatelessWidget {
  final ProductEntity productEntity;
  final int page;
  const SynopsisBook(
      {super.key, required this.productEntity, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DSH(200),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: DSH(16)),
        padding: EdgeInsets.only(
            top: DSH(12), bottom: DSH(12), left: DSW(12), right: DSW(12)),
        decoration: BoxDecoration(
            color: AppColors.backgroundsecondary,
            borderRadius: BorderRadius.circular(DSH(20))),
        child:
            //Row(
            //children: [
            //Text("selected : ", style: TextStyle(fontSize: DSH(16))),
            Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Synopsis ${productEntity.booknoModel[page].title}",
                style: TextStyle(
                  fontSize: DSH(14),
                )),
            Text("Synopsis ${productEntity.booknoModel[page].title}",
                style: TextStyle(
                  fontSize: DSH(14),
                )),
            //_widtht(context),
            // Icon(
            //   Icons.keyboard_arrow_down,
            //   size: DSH(40),
            //)
          ],
        )
        //],
        //),
        );
  }
}
