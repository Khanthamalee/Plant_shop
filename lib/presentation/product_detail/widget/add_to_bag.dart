import 'package:firebase_shop/common/bloc/button/button_state_cubit.dart';
import 'package:firebase_shop/data/order/models/add_to_cart_req.dart';
import 'package:firebase_shop/domain/order/usecase/add_to_cart.dart';
import 'package:firebase_shop/presentation/product_detail/bloc/product_language_selected_cubit.dart';
import 'package:firebase_shop/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/product/product_button_price.dart';
import '../../../common/widget/button/basic_reactive_button.dart.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class AddToBag extends StatelessWidget {
  final UserEntity user;
  final double price;
  final ProductEntity productEntity;
  final int page;
  AddToBag(
      {super.key,
      required this.productEntity,
      required this.user,
      required this.price,
      required this.page});

  List<String> _language = ["Thai", "English"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: DSW(8), right: DSW(8), bottom: DSH(15)),
      child: BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
              usecase: AddToCartUseCase(),
              params: AddToCartReq(
                  productId: productEntity.booknoModel[page].Id,
                  productTitle: productEntity.booknoModel[page].title,
                  productQauntity: context.read<ProductQuantityCubit>().state,
                  productlanguage: _language[context
                      .read<ProductLanguageSelectedCubit>()
                      .selectedIndex],
                  productPrice:
                      price / context.read<ProductQuantityCubit>().state,
                  totalPrice: price,
                  productImage: productEntity.booknoModel[page].image,
                  createData: DateTime.now().toString()));
          print(productEntity.productId);
          print(productEntity.booknoModel[page].title);
          print(context.read<ProductQuantityCubit>().state);
          print(_language[
              context.read<ProductLanguageSelectedCubit>().selectedIndex]);
          print(productEntity.booknoModel[page].price);
          print(price);
          print("Add data success");
        },
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${price}  Baht",
                style: TextStyle(
                    fontSize: DSH(18),
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400)),
            Text("Add to bag",
                style: TextStyle(
                    fontSize: DSH(18),
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
