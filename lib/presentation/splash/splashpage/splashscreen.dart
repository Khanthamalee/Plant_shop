import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../auth/pages/signin.dart';
import '../../home/pages/home.dart';
import '../bloc/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<Splashcubit, Splashstate>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, Signinpage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.AppLogo,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
