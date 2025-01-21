import 'package:firebase_shop/data/product/models/product.dart';
import 'package:firebase_shop/presentation/home/bloc/top_selling_display_cubit.dart';
import 'package:firebase_shop/presentation/home/bloc/top_selling_display_state.dart';
import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/product/entities/product.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopSellingDisplayCubit()..displayTopSelling(),
      child: Padding(
        padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
        child: BlocBuilder<TopSellingDisplayCubit, TopSellingDisplayState>(
          builder: (context, state) {
            if (state is ProductisLoading) {
              print(state);
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductisLoaded) {
              print(state);
              print(state.products);
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topSellingText(),
                  _height(context),
                  _topSellingList(state.products, context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 15);
  }

  Widget _topSellingText() {
    return Text(
      "Top selling",
      style: TextStyle(fontSize: DSH(16), fontWeight: FontWeight.w500),
    );
  }

  Widget _topSellingList(List<ProductEntity> products, BuildContext context) {
    print("products $products");
    return SizedBox(
      height: DSH(250),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: DSH(160),
                width: DSW(55),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DSH(10)),
                  //shape: BoxShape.rectangle,

                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(products[index].image[0]),
                      fit: BoxFit.fill),
                ),
              ),
              _height(context),
              SizedBox(
                width: DSW(50),
                child: Text(
                  // "Top selling",
                  "${products[index].title}",
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
        itemCount: products.length,
        // itemCount: categories.length,
        separatorBuilder: (context, index) => _widtht(context),
      ),
    );
  }
}
