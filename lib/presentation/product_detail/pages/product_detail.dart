import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/product/product_button_price.dart';
import '../../../common/helper/product/product_price.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/product/entities/product.dart';
import '../../../responsive/dimension.dart';
import '../widget/add_to_bag.dart';
import '../widget/product_images.dart';
import '../widget/product_price.dart';
import '../widget/product_quntity.dart';
import '../widget/product_title.dart';
import '../widget/synopsis_book.dart';

class ProductDetailPage extends StatefulWidget {
  final UserEntity user;
  final ProductEntity productEntity;
  const ProductDetailPage(
      {super.key, required this.productEntity, required this.user});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        //scalepage x unit pixel
        _currPageValue = pageController.page!;
        //print("Current value is " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductQuantityCubit())],
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: DSH(450),
                child: Padding(
                  padding: EdgeInsets.only(left: DSW(15), right: DSW(15)),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    separatorBuilder: (context, index) => _widtht(context),
                    itemCount: widget.productEntity.booknoModel.length,
                    itemBuilder: (contaxt, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductImages(
                              image: widget
                                  .productEntity.booknoModel[index].image),
                          _height(context),
                          _height(context),
                          ProductTitle(
                              title: widget
                                  .productEntity.booknoModel[index].title),
                          _height(context),
                          BlocBuilder<ProductQuantityCubit, int>(
                            builder: (context, state) {
                              var price =
                                  ProductPriceHelper.provideCurrentPrice(
                                      widget.productEntity,
                                      widget.user,
                                      _currPageValue.toInt());
                              return ProductPrice(price: price
                                  //_productprice(_currPageValue.toInt()),
                                  );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SynopsisBook(
                  productEntity: widget.productEntity,
                  page: _currPageValue.toInt()),
              _height(context),
              ProductQuntity(productEntity: widget.productEntity),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<ProductQuantityCubit, int>(
          builder: (context, state) {
            var price = ProductButtonPrice.provideCurrentPrice(
                    widget.productEntity, widget.user, _currPageValue.toInt()) *
                state;
            return AddToBag(productEntity: widget.productEntity, price: price);
          },
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 15);
  }
}
