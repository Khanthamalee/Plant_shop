import 'package:firebase_shop/common/bloc/category/categories_display_cubit.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/category/categories_display_state.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../domain/category/entity/category.dart';
import '../../../responsive/dimension.dart';
import '../../category_products/pages/category_products.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
          child: BlocProvider(
            create: (context) => CategoriesDisplayCubit()..displayCategories(),
            child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
                builder: (context, state) {
              if (state is CategoriesisLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoriesisLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _shopByCategoriesText(),
                    _height(context),
                    _shopByCategoriesList(state.categories, context)
                  ],
                );
              }
              return Container();
            }),
          ),
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _shopByCategoriesText() {
    return Text(
      "Shop by categories",
      style: TextStyle(
          fontSize: DSH(20),
          fontWeight: FontWeight.w500,
          color: AppColors.textsecondary),
    );
  }

  Widget _shopByCategoriesList(
      List<CategoryEntity> categories, BuildContext context) {
    print(categories);
    return SizedBox(
      height: DSH(740),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AppNavigator.push(
                  context,
                  CategoryProducts(
                    categoryEntity: categories[index],
                  ));
            },
            child: Container(
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
                            image: AssetImage(categories[index].image),
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
                        "${categories[index].title}",
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
            ),
          );
        },
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) {
          return _height(context);
        },
        // itemCount: categories.length,
      ),
    );
  }
}
