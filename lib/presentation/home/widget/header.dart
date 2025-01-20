import 'package:firebase_shop/domain/entity/user.dart';
import 'package:firebase_shop/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:firebase_shop/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            print("state : $state");
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            print("state : $state");
            return Container(
              padding: EdgeInsets.only(top: DSH(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user),
                  _gender(state.user),
                  _card()
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    print("user.image : ${user.image}");
    return Container(
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
          user.gender == 1 ? "Men" : "Woman",
          style: TextStyle(fontSize: DSH(20), fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      height: DSH(50),
      width: DSW(50),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(AppVectors.cart))),
    );
  }
}
