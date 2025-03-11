import 'package:firebase_shop/common/bloc/product/product_display_cubit.dart';
import 'package:firebase_shop/common/bloc/product/product_display_state.dart';
import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/domain/product/usecases/get_products_by_title.dart';
import 'package:firebase_shop/presentation/home/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import '../../../service_locator.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(usecase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppBar(
          hetght: 70,
          width: 50,
          title: SearchField(),
        ),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsisLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsisLoaded) {
              return state.products.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
                      child: _notFound(),
                    )
                  : _searchList(state.products, context);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              //color: AppColors.primary,
              image: DecorationImage(
                  image: AssetImage(
            "assets/images/not-found.png",
          ))),
        ),
        Padding(
          padding: EdgeInsets.only(left: DSW(40), right: DSW(40)),
          child: Text(
            "Sorry, we couldn 't find any matching result for your Search.",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _searchList(List<ProductEntity> products, BuildContext context) {
    print(products);
    return SizedBox(
      height: DSH(740),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: DSW(8.0),
            crossAxisSpacing: DSW(8.0),
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.backgroundsecondary,
            //width: double.infinity,
            height: DSH(500),
            child: Column(children: [
              Expanded(
                flex: 7,
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
