import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/common/widget/button/basic_reactive_button.dart.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:firebase_shop/domain/Auth/usecases/signin.dart';
import 'package:firebase_shop/presentation/auth/pages/forgot_password.dart';
import 'package:firebase_shop/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/button/button_state.dart';
import '../../../common/bloc/button/button_state_cubit.dart';
import '../../../common/widget/appbar/app_bar.dart';
import '../../../data/auth/models/user_signin_req.dart';
import '../../../responsive/dimension.dart';

class EnterPasswordpage extends StatelessWidget {
  final UserSigninReq signinReq;
  final TextEditingController _passwordEditingCon = TextEditingController();
  EnterPasswordpage({super.key, required this.signinReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: DSH(16), vertical: DSH(40)),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                if (state is ButtonSuccessState) {
                  AppNavigator.pushAndRemove(context, HomePage());
                }
              },
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
            ),
          ),
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
      controller: _passwordEditingCon,
      style: TextStyle(color: AppColors.bigtext, fontSize: DSH(18)),
      decoration: const InputDecoration(
        hintText: "Enter password",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          signinReq.password = _passwordEditingCon.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninUsecase(), params: signinReq);
          //AppNavigator.push(context, GenderAndAgeSelectionPage());
          print(signinReq.email);
          print(signinReq.password);
        },
        title: "Continue",
      );
    });
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
                  AppNavigator.push(context, ForgotPassword());
                },
              text: "Reset",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
