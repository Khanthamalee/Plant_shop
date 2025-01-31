import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/order/entity/order.dart';
import '../../../responsive/dimension.dart';
import 'order_item.dart';

class OrderDetailPage extends StatelessWidget {
  final UserEntity userEntity;
  final OrderEntity orderEntity;
  const OrderDetailPage(
      {super.key, required this.orderEntity, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text("order #${orderEntity.code}")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: DSW(15), right: DSW(15), top: DSH(15), bottom: DSH(15)),
          child: Column(
            children: [
              _status(context),
              _height(context),
              _height(context),
              _height(context),
              _item(context),
              _height(context),
              _height(context),
              _height(context),
              _shipping(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _status(BuildContext context) {
    return SizedBox(
      height: DSH(300),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: DSH(30),
                      width: DSW(20),
                      decoration: BoxDecoration(
                          color: orderEntity.orderStatus[index].done
                              ? AppColors.backgroundsecondary
                              : AppColors.primary,
                          shape: BoxShape.circle),
                      child: orderEntity.orderStatus[index].done
                          ? Icon(Icons.check)
                          : Container(),
                    ),
                    _widtht(context),
                    Text(
                      orderEntity.orderStatus[index].title,
                      style: TextStyle(
                          fontSize: DSH(16),
                          color: orderEntity.orderStatus[index].done
                              ? Colors.grey
                              : AppColors.primary),
                    ),
                  ],
                ),
                Text(
                    '${orderEntity.orderStatus[index].createDate.toDate().toString().split(' ')[0]}  ',
                    style: TextStyle(
                      fontSize: DSH(16),
                    )),
              ],
            );
          },
          reverse: true,
          separatorBuilder: (context, index) => WH(context, 50),
          itemCount: orderEntity.orderStatus.length),
    );
  }

  Widget _item(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Items",
          style: TextStyle(fontSize: DSH(18)),
          textAlign: TextAlign.left,
        ),
        _height(context),
        Container(
          height: DSH(70),
          decoration: BoxDecoration(
            color: AppColors.backgroundsecondary,
            borderRadius: BorderRadius.circular(DSH(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: DSW(10), right: DSW(10), top: DSH(8), bottom: DSH(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.receipt_sharp),
                    _widtht(context),
                    _widtht(context),
                    _widtht(context),
                    Text('${orderEntity.itemCount} items',
                        style: TextStyle(
                            fontSize: DSH(16), color: AppColors.primary)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(
                        context,
                        OrderItemsPage(
                            productOrderedEntity: orderEntity.products));
                  },
                  child: Text(' View All',
                      style: TextStyle(
                          fontSize: DSH(16), color: AppColors.textsecondary)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _shipping(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping details",
          style: TextStyle(fontSize: DSH(18)),
          textAlign: TextAlign.left,
        ),
        _height(context),
        Container(
          height: DSH(100),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.backgroundsecondary,
            borderRadius: BorderRadius.circular(DSH(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: DSW(10), right: DSW(10), top: DSH(8), bottom: DSH(8)),
            child: Text('${orderEntity.shippingadress} ',
                style: TextStyle(fontSize: DSH(16), color: AppColors.primary)),
          ),
        )
      ],
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 5);
  }
}
