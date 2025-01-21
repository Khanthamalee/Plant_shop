import 'package:firebase_shop/core/configs/assets/app_vector.dart';
import 'package:flutter/material.dart';

import '../../../responsive/dimension.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: DSH(30), right: DSH(30)),
      child: TextField(
        decoration: InputDecoration(
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
              padding: const EdgeInsets.all(8.0),
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
            hintText: 'search'),
      ),
    );
  }
}
