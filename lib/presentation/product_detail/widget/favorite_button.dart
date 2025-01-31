import 'package:firebase_shop/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(productEntity);
        //AppNavigator.push(context, widget);
      },
      icon: Container(
        height: DSH(40),
        width: DSW(30),
        decoration: BoxDecoration(
            color: AppColors.backgroundsecondary, shape: BoxShape.circle),
        child: BlocBuilder<FavoriteIconCubit, bool>(
            builder: (context, state) => state
                ? Icon(Icons.favorite, size: DSH(15), color: AppColors.primary)
                : Icon(Icons.favorite_outline,
                    size: DSH(15), color: AppColors.primary)),
      ),
    );
  }
}
