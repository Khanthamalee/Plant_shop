import 'package:firebase_shop/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../auth/pages/signin.dart';
import '../bloc/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<Splashcubit, Splashstate>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Signinpage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SvgPicture.asset(
            AppVector.AppLogo,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
