import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:firebase_shop/presentation/settings/bloc/order_display_cubit.dart';
import 'package:firebase_shop/presentation/settings/bloc/order_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/order/entity/order.dart';
import '../../../responsive/dimension.dart';
import 'order_detail.dart';

class MyOrdersPage extends StatelessWidget {
  final UserEntity userEntity;
  const MyOrdersPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("My Orders"),
      ),
      body: BlocProvider(
          create: (context) => OrderDisplayCubit()..displayOrders(),
          child: BlocBuilder<OrderDisplayCubit, OrderDisplayState>(
              builder: (context, state) {
            if (state is OrderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is OrderLoaded) {
              return _order(state.orders, context, userEntity);
            }

            if (state is LoadOrderFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return Container();
          })),
    );
  }

  Widget _order(
      List<OrderEntity> orders, BuildContext context, UserEntity userEntity) {
    return Padding(
      padding: EdgeInsets.only(
          left: DSW(10), right: DSW(10), top: DSH(15), bottom: DSH(15)),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigator.push(
                    context,
                    OrderDetailPage(
                        orderEntity: orders[index], userEntity: userEntity));
              },
              child: Container(
                height: DSH(70),
                padding: EdgeInsets.symmetric(horizontal: DSH(16)),
                decoration: BoxDecoration(
                  color: AppColors.backgroundsecondary,
                  borderRadius: BorderRadius.circular(DSH(10)),
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.receipt_rounded),
                    Padding(
                      padding: EdgeInsets.only(left: DSW(10), right: DSW(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order #${orders[index].code}",
                            style: TextStyle(
                                fontSize: DSH(16),
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                          ),
                          Text(
                            "${orders[index].itemCount} items",
                            style: TextStyle(
                                fontSize: DSH(14),
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => _height(context),
          itemCount: orders.length),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }
}
