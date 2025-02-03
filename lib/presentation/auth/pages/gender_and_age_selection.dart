import 'package:firebase_shop/common/bloc/button/button_state.dart';
import 'package:firebase_shop/common/bloc/button/button_state_cubit.dart';
import 'package:firebase_shop/common/helper/Navigator/app_navigator.dart';
import 'package:firebase_shop/common/helper/bottomsheet/app_bottom_sheet.dart';
import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/common/widget/button/basic_reactive_button.dart.dart';
import 'package:firebase_shop/core/configs/theme/app_color.dart';
import 'package:firebase_shop/domain/Auth/usecases/signup.dart';
import 'package:firebase_shop/presentation/auth/widgets/ages.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_display_cubit.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_selection_cubit.dart';
import 'package:firebase_shop/presentation/splash/bloc/gerder_cubic_selection.dart';
import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/auth/models/user_creation_req.dart';
import '../../home/pages/home.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreateReq;

  const GenderAndAgeSelectionPage({super.key, required this.userCreateReq});

  @override
  Widget build(BuildContext context) {
    print(userCreateReq.firstName);
    return Scaffold(
      appBar: const BasicAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: DSH(16), vertical: DSH(40)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tellusText(),
                      _height(context),
                      _gender(context),
                      _height(context),
                      _howoldText(),
                      _height(context),
                      _ageDropdawn(),
                      _height(context),
                    ],
                  ),
                ),
              ),
              _finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }

  Widget _widtht(BuildContext context) {
    return WW(context, 30);
  }

  Widget _tellusText() {
    return Text(
      "Tell us about yourself",
      style: TextStyle(fontSize: DSH(24), fontWeight: FontWeight.w500),
    );
  }

  Widget _gender(context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(children: [
        genderTile(context, 1, "General"),
        _widtht(context),
        genderTile(context, 2, "VIP"),
      ]);
    });
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
            height: DSH(60),
            decoration: BoxDecoration(
                color: context.read<GenderSelectionCubit>().selectedIndex ==
                        genderIndex
                    ? AppColors.secondary
                    : AppColors.backgroundsecondary,
                borderRadius: BorderRadius.circular(DSH(30))),
            child: Center(
              child: Text(gender,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: DSH(18))),
            )),
      ),
    );
  }

  Widget _howoldText() {
    return Text(
      "How old are you?",
      style: TextStyle(fontSize: DSH(18), fontWeight: FontWeight.w500),
    );
  }

  Widget _ageDropdawn() {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
              context,
              MultiBlocProvider(providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displaiAges()),
              ], child: Ages()));
        },
        child: Container(
            height: DSH(60),
            padding: EdgeInsets.symmetric(
              horizontal: DSH(25),
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundsecondary,
              borderRadius: BorderRadius.circular(
                DSH(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: TextStyle(fontSize: DSH(18)),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            )),
      );
    });
  }

  Widget _finishButton(BuildContext context) {
    return Container(
        height: DSH(100),
        color: AppColors.backgroundsecondary,
        padding: EdgeInsets.symmetric(
          horizontal: DSH(16),
        ),
        child: Center(
          child: Builder(builder: (context) {
            return BasicReactiveButton(
              onPressed: () {
                userCreateReq.gender =
                    context.read<GenderSelectionCubit>().selectedIndex;
                userCreateReq.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                context
                    .read<ButtonStateCubit>()
                    .execute(usecase: SignupUsecase(), params: userCreateReq);
                print(userCreateReq.firstName);
                print(userCreateReq.gender);
                print(userCreateReq.age);
                AppNavigator.push(context, HomePage());
              },
              title: 'Finish',
            );
          }),
        ));
  }
}
