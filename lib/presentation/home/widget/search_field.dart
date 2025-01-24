import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/common/bloc/product/product_display_cubit.dart';
import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/core/configs/assets/app_vector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../../search/pages/search.dart';

class SearchField extends StatelessWidget {
  final double? padleft;
  final double? padright;

  const SearchField({super.key, this.padleft, this.padright});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
      child: TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              context.read<ProductsDisplayCubit>().diaplayInitial();
            } else {
              context
                  .read<ProductsDisplayCubit>()
                  .displayProducts(params: value);
            }
          },
          cursorColor: AppColors.backgroundsecondary,
          decoration: InputDecoration(
            //prefixIconColor: AppColors.backgroundsecondary,
            //suffixIconColor: AppColors.backgroundsecondary,
            contentPadding: EdgeInsets.all(DSH(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                DSH(50),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                DSH(50),
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(DSW(5)),
              child: GestureDetector(
                onTap: () {
                  AppNavigator.push(context, SearchPage());
                },
                child: Container(
                  height: DSH(30),
                  width: DSW(30),
                  decoration: BoxDecoration(
                    //color: AppColors.background,
                    //shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(AppVectors.search), scale: 0.5),
                  ),
                ),
              ),
            ),
            hintText: 'search',
          ),
          style: TextStyle(
            color: AppColors.secondary,
          )),
    );
  }
}
