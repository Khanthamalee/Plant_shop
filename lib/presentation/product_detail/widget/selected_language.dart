import 'package:firebase_shop/common/helper/bottomsheet/app_bottom_sheet.dart';
import 'package:firebase_shop/presentation/product_detail/bloc/product_language_selected_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import 'product_language.dart';

class SelectedLanguage extends StatelessWidget {
  final ProductEntity productEntity;
  final int page;
  SelectedLanguage(
      {super.key, required this.productEntity, required this.page});
  List<String> _language = ["Thai", "English"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductLanguageSelectedCubit>(context),
                child: ProductLanguage(language: _language)));
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
              BlocBuilder<ProductLanguageSelectedCubit, int>(
                builder: (context, state) => Text(_language[state],
                    style: TextStyle(
                      fontSize: DSH(16),
                    )),
              ),
              _widtht(context),
              Icon(
                Icons.keyboard_arrow_down,
                size: DSH(40),
              )
            ],
          )),
    );
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 5);
  }
}
