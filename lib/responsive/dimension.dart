import 'package:flutter/material.dart';

//responsive Height no context
double DSH(double Sheight) {
  double maxH = 890.2857142857143;
  double height = WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.height /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  double dsh = Sheight * height / maxH;
  return dsh;
}

//responsive Width no context
double DSW(double Swidth) {
  double maxW = 411.42857142857144;
  double width = WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.height /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  double dsw = Swidth * width / maxW;
  return dsw;
}

//responsive Height
double SH(double height, BuildContext context) {
  double hscreen = MediaQuery.of(context).size.height;
  double max = 890.2857142857143;
  double sh = hscreen * height / max;
  return sh;
}

//responsive Weight
double SW(double height, BuildContext context) {
  double wscreen = MediaQuery.of(context).size.width;
  double max = 890.2857142857143;
  double sw = wscreen * height / max;
  return sw;
}

//responsive Height box
Widget WH(BuildContext context, double height) {
  return SizedBox(
    height: SH(height, context),
  );
}

//responsive Width box
Widget WW(BuildContext context, double width) {
  return SizedBox(
    width: SW(width, context),
  );
}
