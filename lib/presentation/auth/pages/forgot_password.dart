import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../responsive/dimension.dart';
import 'enter_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: DSH(16), vertical: DSH(60)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                _height(context),
                _passwordField(context),
                _height(context),
                _continueButton(context),
              ]),
        ));
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _signinText(BuildContext context) {
    return Text(
      "Forgot Password",
      style: TextStyle(fontSize: DSH(30), fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.bigtext, fontSize: DSH(18)),
      decoration: const InputDecoration(
        hintText: "Enter password",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BaseAppButton(
      onPressed: () {
        //AppNavigator.push(context, const EnterPasswordpage());
      },
      title: "Continue",
    );
  }
}
