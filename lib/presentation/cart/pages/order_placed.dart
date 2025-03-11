import 'package:firebase_shop/common/widget/button/base_app_button.dart';
import 'package:flutter/material.dart';

import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../responsive/dimension.dart';
import '../../home/pages/home.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _orderPlaced(context),
      bottomNavigationBar: _backtoHomepage(context),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _orderPlaced(BuildContext context) {
    return Center(
      child: SizedBox(
        height: DSH(400),
        //color: AppColors.backgroundsecondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppVectors.orderplaced),
            _height(context),
            Text(
              "Order Placed Successfully",
              style: TextStyle(fontSize: DSH(20), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backtoHomepage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: DSH(15), left: DSW(15), right: DSW(15)),
      child: BaseAppButton(
        height: DSH(60),
        onPressed: () {
          AppNavigator.push(context, HomePage());
        },
        title: 'Back to Homepage',
      ),
    );
  }
}
