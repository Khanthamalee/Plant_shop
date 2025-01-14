import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../responsive/dimension.dart';
import 'enter_password.dart';
import 'signup.dart';

class Signinpage extends StatelessWidget {
  Signinpage({super.key});

  @override
  TextEditingController emailEditingController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(hideBack: true),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: DSH(16), vertical: DSH(40)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                _height(context),
                _emailField(context),
                _height(context),
                _continueButton(context),
                _height(context),
                _createAccount(context),
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

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: emailEditingController,
      style: TextStyle(color: AppColors.bigtext, fontSize: DSH(18)),
      decoration: const InputDecoration(
        hintText: "Enter email",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BaseAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordpage());
      },
      title: "Continue",
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontFamily: 'BreeSerif'),
        children: [
          TextSpan(text: "Don't you have an account?  "),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context,  Signuppage());
                },
              text: "Create one",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
