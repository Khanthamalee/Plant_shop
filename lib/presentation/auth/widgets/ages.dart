import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_display_cubit.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_display_state.dart';
import 'package:firebase_shop/presentation/splash/bloc/age_selection_cubit.dart';
import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.7,
        child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
            builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return _ages(state.ages);
          }
          if (state is AgesLoadFailure) {
            return Container(
                alignment: Alignment.center, child: Text(state.message));
          }
          return SizedBox();
        }));
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        padding: EdgeInsets.all(DSH(25)),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context
                  .read<AgeSelectionCubit>()
                  .selectAge(ages[index].data()['value']);
            },
            child: Text(ages[index].data()["value"],
                style: TextStyle(fontSize: DSH(20))),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: DSH(20),
            ),
        itemCount: ages.length);
  }
}
