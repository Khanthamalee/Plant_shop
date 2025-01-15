import 'package:firebase_shop/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../common/widget/button/base_app_button.dart';
import '../../../responsive/dimension.dart';

class PasswordResetEmail extends StatelessWidget {
  const PasswordResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: DSH(200)),
          child: Column(children: [
            _emailSending(),
            _height(context),
            _sendEmail(),
            _height(context),
            _returnToLoginButton(context),
          ]),
        ));
  }

  Widget _emailSending() {
    return Center(child: Image.asset("assets/images/send-email.png"));
  }
}

Widget _height(BuildContext context) {
  return WH(context, 20);
}

Widget _sendEmail() {
  return Text(
    "We Send you an Email to reset your password",
    style: TextStyle(fontSize: DSH(20), fontWeight: FontWeight.w500),
  );
}

Widget _returnToLoginButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: DSW(60), right: DSW(60)),
    child: BaseAppButton(
      onPressed: () {
        AppNavigator.push(context, Signinpage());
      },
      title: "Return to Login",
    ),
  );
}
