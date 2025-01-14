import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../responsive/dimension.dart';
import 'enter_password.dart';
import 'signin.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

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
                _creatAccountText(context),
                _height(context),
                _inputTextField(context, "Firstname"),
                _height(context),
                _inputTextField(context, "Lastname"),
                _height(context),
                _inputTextField(context, "Email"),
                _height(context),
                _inputTextField(context, "Password"),
                _height(context),
                _continueButton(context),
                _height(context),
                _createAccount(context)
              ]),
        ));
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _creatAccountText(BuildContext context) {
    return Text(
      "Creat Account",
      style: TextStyle(fontSize: DSH(30), fontWeight: FontWeight.bold),
    );
  }

  Widget _inputTextField(BuildContext context, String hintText) {
    return TextField(
      style: TextStyle(color: AppColors.bigtext, fontSize: DSH(18)),
      decoration: InputDecoration(
        hintText: hintText,
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

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontFamily: 'BreeSerif'),
        children: [
          TextSpan(text: "Do you have an account ?  "),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context, Signinpage());
                },
              text: "Sign in",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
