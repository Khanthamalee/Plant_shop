import 'package:firebase_shop/common/bloc/product/product_display_state.dart';
import 'package:firebase_shop/domain/category/entity/category.dart';
import 'package:firebase_shop/responsive/dimension.dart';
import 'package:firebase_shop/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/product/product_display_cubit.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/product/product_card.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/product/entities/product.dart';
import '../../../domain/product/usecases/get_products_by_categoryId.dart';

class CategoryProducts extends StatelessWidget {
  final UserEntity user;
  final CategoryEntity categoryEntity;

  const CategoryProducts(
      {super.key, required this.categoryEntity, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(hideBack: false),
        body: BlocProvider(
            create: (context) => ProductsDisplayCubit(
                usecase: sl<GetProductsByCategoryidUseCase>())
              ..displayProducts(params: categoryEntity.categoryId),
            child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
              builder: (context, state) {
                if (state is ProductsisLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ProductsisLoaded) {
                  return Padding(
                    padding: EdgeInsets.only(left: DSH(15), right: DSH(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shopByCategoriesText(state.products, context),
                        _height(context),
                        _shopByCategoriesList(state.products, context,user)
                      ],
                    ),
                  );
                }
                return Container();
              },
            )));
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _shopByCategoriesText(
      List<ProductEntity> products, BuildContext context) {
    return Text(
      "${products[0].title}",
      style: TextStyle(
          fontSize: DSH(20),
          fontWeight: FontWeight.w500,
          color: AppColors.textsecondary),
    );
  }

  Widget _shopByCategoriesList(
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
