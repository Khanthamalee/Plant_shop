import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../responsive/dimension.dart';
import '../bloc/user_info_display_cubit.dart';
import '../bloc/user_info_display_state.dart';
import '../widget/categories.dart';
import '../widget/header.dart';
import '../widget/new_in.dart';
import '../widget/search_field.dart';
import '../widget/top_selling.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
        if (state is UserInfoLoading) {
          print("state : $state");
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserInfoLoaded) {
          return Scaffold(
            //appBar: const BasicAppBar(hideBack: true),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    user: state.user,
                  ),
                  _height(context),
                  SearchField(),
                  _height(context),
                  Categories(user : state.user),
                  _height(context),
                  TopSelling(
                    user: state.user,
                  ),
                  _height(context),
                  NewIn(
                    user: state.user,
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }
}
