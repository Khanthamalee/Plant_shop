import 'package:firebase_shop/common/bloc/product/product_display_cubit.dart';
import 'package:firebase_shop/common/bloc/product/product_display_state.dart';
import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/domain/product/usecases/get_favorite.dart';
import 'package:firebase_shop/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:firebase_shop/presentation/home/bloc/top_selling_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widget/product/product_card.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import '../../../service_locator.dart';

class MyFavoritesPage extends StatelessWidget {
  final UserEntity userEntity;
  const MyFavoritesPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(" My Favorite"),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(usecase: sl<GetFavoriteUseCase>())
              ..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductisLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductsisLoaded) {
              print('MyFavoritesPage :${state.products}');
              return Padding(
                padding: EdgeInsets.only(
                    left: DSW(10),
                    right: DSW(10),
                    top: DSH(15),
                    bottom: DSH(15)),
                child: _favoriteCategoriesList(
                    state.products, context, userEntity),
              );
            }

            if (state is LoadCartProductsFailure) {
              return Center(child: Text("Please try again"));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _favoriteCategoriesList(
      List<ProductEntity> products, BuildContext context, UserEntity user) {
    print(products);
    return SizedBox(
      height: DSH(740),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: DSW(8.0),
            crossAxisSpacing: DSW(8.0),
            childAspectRatio: 0.9),
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.backgroundsecondary,
            //width: double.infinity,
            height: DSH(500),
            child: Column(children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(DSH(8)),
                  child: ProductCard(
                    productEntity: products[index],
                    user: user,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: DSW(10),
                        right: DSW(10),
                        top: DSH(8),
                        bottom: DSH(8)),
                    child: Text(
                      //"Food risk managemant book Food risk managemant book Food risk managemant book",
                      "${products[index].title}",
                      style: TextStyle(
                          fontSize: DSH(16), fontWeight: FontWeight.w200),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ]),
          );
        },
        // separatorBuilder: (BuildContext context, int index) {
        //   return _height(context);
        //},
        itemCount: products.length,
      ),
    );
  }
}
