import 'package:firebase_shop/common/bloc/button/button_state_cubit.dart';
import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:firebase_shop/domain/Auth/usecases/send_password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/button/button_state.dart';
import '../../../common/helper/Navigator/app_navigator.dart';
import '../../../common/widget/button/basic_reactive_button.dart.dart';
import '../../../responsive/dimension.dart';
import 'password_reset_email.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController _emailEditingcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(),
        body: BlocProvider(
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
                AppNavigator.push(context, PasswordResetEmail());
              }
            },
            child: Padding(
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
            ),
          ),
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
      controller: _emailEditingcon,
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
          context.read<ButtonStateCubit>().execute(
              usecase: SendPasswordResetEmailUsecase(),
              params: _emailEditingcon.text);
          // AppNavigator.push(context, const PasswordResetEmail());
        },
        title: "Continue",
      );
    });
  }
}
