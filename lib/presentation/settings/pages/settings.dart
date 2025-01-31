import 'package:firebase_shop/common/widget/appbar/app_bar.dart';
import 'package:firebase_shop/domain/entity/user.dart';
import 'package:firebase_shop/presentation/settings/widgets/my_favorites_title.dart';
import 'package:firebase_shop/presentation/settings/widgets/my_order_tile.dart';
import 'package:flutter/material.dart';

import '../../../responsive/dimension.dart';

class SettingsPage extends StatelessWidget {
  final UserEntity userEntity;
  const SettingsPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(title: Text("Settings")),
        body: Padding(
          padding: EdgeInsets.only(
              top: DSH(15), bottom: DSH(15), left: DSW(10), right: DSW(10)),
          child: Column(
            children: [
              MyFavoritesTitle(userEntity: userEntity),
              _height(context),
              MyOrderTile(userEntity: userEntity),
            ],
          ),
        ));
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }
}
