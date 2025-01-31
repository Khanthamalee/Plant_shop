import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:flutter/material.dart';


import '../../../core/configs/theme/app_color.dart';
import '../../../domain/order/entity/product_ordered.dart';
import '../../../responsive/dimension.dart';
import '../../cart/widget/cart_ordered_image.dart';
import '../widgets/order_items_detail.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> productOrderedEntity;
  const OrderItemsPage({super.key, required this.productOrderedEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          title: Text("Cart"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    _height(context),
                itemCount: productOrderedEntity.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(left: DSW(8), right: DSW(8)),
                  child: Container(
                    height: DSH(120),
                    color: AppColors.backgroundsecondary,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: CartOrderedImage(
                                products: productOrderedEntity[index])),
                        Expanded(
                            flex: 5,
                            child: OrderItemsDetail(
                                products: productOrderedEntity[index]))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //CartCheckout(products: productOrderedEntity),
          ],
        ));
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }
}
