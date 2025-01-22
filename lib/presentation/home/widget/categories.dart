import 'package:firebase_shop/domain/category/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/category/categories_display_cubit.dart';
import '../../../common/bloc/button/category/categories_display_state.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../../all_categories/pages/all_categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
          builder: (context, state) {
        if (state is CategoriesisLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoriesisLoaded) {
          return Padding(
            padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
            child: SizedBox(
              child: Column(
                children: [
                  _seeAll(context),
                  _height(context),
                  _categories(state.categories, context),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 15);
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 15);
  }

  Widget _seeAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: TextStyle(
              fontSize: DSH(16),
              fontWeight: FontWeight.w500,
              color: AppColors.textsecondary),
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.push(context, AllCategories());
          },
          child: Text(
            "See All",
            style: TextStyle(fontSize: DSH(16), fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _categories(List<CategoryEntity> categories, BuildContext context) {
    return SizedBox(
      height: DSH(135),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: DSH(65),
                width: DSW(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DSH(10)),
                  //shape: BoxShape.rectangle,

                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.fill),
                ),
              ),
              _height(context),
              SizedBox(
                width: DSW(40),
                child: Text(
                  "${categories[index].title}",
                  style:
                      TextStyle(fontSize: DSH(12), fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
        itemCount: categories.length,
        separatorBuilder: (context, index) => _widtht(context),
      ),
    );
  }
}
