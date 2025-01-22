import 'package:firebase_shop/common/bloc/product/product_display_state.dart';
import 'package:firebase_shop/responsive/dimension.dart';
import 'package:firebase_shop/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/product/product_display_cubit.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../domain/product/usecases/get_products_by_categoryId.dart';

class CategoryProducts extends StatelessWidget {
  final String categoryId;

  const CategoryProducts({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(hideBack: false),
        body: BlocProvider(
            create: (context) => ProductsDisplayCubit(
                usecase: sl<GetProductsByCategoryidUseCase>())
              ..displayProducts(params: categoryId),
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
                        _shopByCategoriesList(state.products, context)
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
      List<ProductEntity> products, BuildContext context) {
    print(products);
    return SizedBox(
      height: DSH(740),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.backgroundsecondary,
            width: double.infinity,
            height: DSH(100),
            child: Row(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(DSH(8)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DSH(10)),
                      //shape: BoxShape.rectangle,

                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(products[index].image[0]),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
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
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              )
            ]),
          );
        },
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return _height(context);
        },
        // itemCount: categories.length,
      ),
    );
  }
}
