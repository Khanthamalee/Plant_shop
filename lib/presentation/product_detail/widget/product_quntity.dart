import 'package:firebase_shop/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';

class ProductQuntity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuntity({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DSH(60),
      margin: EdgeInsets.symmetric(horizontal: DSH(18)),
      padding: EdgeInsets.only(left: DSW(12)),
      decoration: BoxDecoration(
        color: AppColors.backgroundsecondary,
        borderRadius: BorderRadius.circular(
          DSH(100),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Quantity",
          style: TextStyle(fontSize: DSH(16)),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
               // print("decrement");
                context.read<ProductQuantityCubit>().decrement();
              },
              icon: Container(
                height: DSH(40),
                width: DSW(40),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.secondary),
                child: Icon(
                  Icons.remove,
                  size: DSH(30),
                  color: Colors.white,
                ),
              ),
            ),
            // _widtht(context),
            BlocBuilder<ProductQuantityCubit, int>(
              
              builder: (context, state) => Text(
                
                "$state",
                style:
                    TextStyle(fontSize: DSH(18), fontWeight: FontWeight.bold),
              ),
            ),
            //_widtht(context),
            IconButton(
              onPressed: () {
                //print("increment");
                context.read<ProductQuantityCubit>().increment();
              },
              icon: Container(
                height: DSH(40),
                width: DSW(40),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.secondary),
                child: Icon(
                  Icons.add,
                  size: DSH(30),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 5);
  }
}
