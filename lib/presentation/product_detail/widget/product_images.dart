import 'package:flutter/material.dart';

import '../../../responsive/dimension.dart';

class ProductImages extends StatelessWidget {
  final String image;

  const ProductImages({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DSH(360),
        width: DSW(190),
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
        ),
        child: Column());
  }
}
