import 'package:firebase_shop/common/bloc/button/button_state.dart';
import 'package:firebase_shop/common/bloc/button/button_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicReactiveButton(
      {required this.onPressed, required this.title, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
      if (state is ButtonLoadingState) {
        return _loading();
      }
      return _initail();
    });
  }

  Widget _loading() {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? DSH(50)),
        //backgroundColor: AppColors.secondary
      ),
      child: Container(
          height: height ?? DSH(50),
          alignment: Alignment.center,
          child: CircularProgressIndicator()),
    );
  }

  Widget _initail() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? DSH(50)),
        //backgroundColor: AppColors.secondary
      ),
      child: Text(title,
          style: TextStyle(
              fontSize: DSH(16),
              color: AppColors.primary,
              fontWeight: FontWeight.w400)),
    );
  }
}
