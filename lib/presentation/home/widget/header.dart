import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/domain/entity/user.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../../cart/pages/cart.dart';
import '../../settings/pages/settings.dart';

class Header extends StatelessWidget {
  final UserEntity user;
  const Header({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: DSH(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profileImage(user, context),
              _gender(user),
              _card(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    print("user.image : ${user.image}");
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, SettingsPage(userEntity: user));
      },
      child: Container(
        height: DSH(50),
        width: DSW(50),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            //image: DecorationImage(image: AssetImage(AppVectors.send_email))
            image: user.image != ""
                ? DecorationImage(image: NetworkImage(user.image), scale: 1.0)
                : DecorationImage(
                    image: AssetImage(
                        user.gender == 1 ? AppVectors.men : AppVectors.woman))),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: DSH(50),
      width: DSW(70),
      decoration: BoxDecoration(
        color: AppColors.backgroundsecondary,
        borderRadius: BorderRadius.circular(
          DSH(100),
        ),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? "General" : "VIP",
          style: TextStyle(fontSize: DSH(20), fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, CartPage());
      },
      child: Container(
        height: DSH(50),
        width: DSW(50),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(AppVectors.cart))),
      ),
    );
  }
}
