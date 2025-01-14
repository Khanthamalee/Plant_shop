import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:firebase_shop/presentation/auth/pages/forgot_password.dart';
import 'package:firebase_shop/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../responsive/dimension.dart';

class EnterPasswordpage extends StatelessWidget {
  const EnterPasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: DSH(16), vertical: DSH(40)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                _height(context),
                _passwordField(context),
                _height(context),
                _continueButton(context),
                _height(context),
                _forgotPassword(context),
              ]),
        ));
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _signinText(BuildContext context) {
    return Text(
      "Sign in",
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
        //AppNavigator.push(context, GenderAndAgeSelectionPage());
      },
      title: "Continue",
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontFamily: 'BreeSerif'),
        children: [
          const TextSpan(text: "Forgot password?  "),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context, const ForgotPassword());
                },
              text: "Reset",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
