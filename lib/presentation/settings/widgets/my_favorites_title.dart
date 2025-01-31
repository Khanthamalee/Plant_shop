import 'package:firebase_shop/domain/entity/user.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../pages/my_favorites.dart';

class MyFavoritesTitle extends StatelessWidget {
  final UserEntity userEntity;
  const MyFavoritesTitle({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("MyFavoritesTitle tap");
        AppNavigator.push(context, MyFavoritesPage(userEntity: userEntity));
      },
      child: Container(
          height: DSH(70),
          decoration: BoxDecoration(
            color: AppColors.backgroundsecondary,
            borderRadius: BorderRadius.circular(
              DSH(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: DSW(10), right: DSW(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Favorites",
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          )),
    );
  }
}
