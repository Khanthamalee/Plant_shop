import 'package:firebase_shop/responsive/dimension.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                DSH(25),
              ),
              topRight: Radius.circular(DSH(25))),
        ),
        builder: (_) {
          return widget;
        });
  }
}
