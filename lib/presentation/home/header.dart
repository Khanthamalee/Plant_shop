import 'package:firebase_shop/domain/entity/user.dart';
import 'package:firebase_shop/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:firebase_shop/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/configs/assets/app_vector.dart';
import '../../core/configs/theme/app_color.dart';
import '../../responsive/dimension.dart';

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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_profileImage(state.user), _gender(), _card()],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return Container(
      height: DSH(40),
      width: DSW(40),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
        //image: DecorationImage(image: AssetImage(AppVectors.send_email))
        // image: DecorationImage(
        //     image: NetworkImage(user.image) ??
        //         AssetImage("${AppVectors.send_email}")),
      ),
    );
  }

  Widget _gender() {
    return Container(
      height: DSH(40),
      width: DSW(70),
      decoration: BoxDecoration(
          color: AppColors.backgroundsecondary,
          borderRadius: BorderRadius.circular(DSH(100))),
    );
  }

  Widget _card() {
    return Container(
      height: DSH(40),
      width: DSW(40),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(AppVectors.send_email))
          // image: DecorationImage(
          //     image: user.image.isEmpty
          //         ? AssetImage(AppVectors.send_email)
          //         : NetworkImage(user.image)),
          ),
    );
  }
}
