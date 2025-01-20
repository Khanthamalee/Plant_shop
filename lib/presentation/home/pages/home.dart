import 'package:flutter/material.dart';

import '../../../responsive/dimension.dart';
import '../widget/categories.dart';
import '../widget/header.dart';
import '../widget/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const BasicAppBar(hideBack: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          _height(context),
          SearchField(),
          _height(context),
          Categories()
        ],
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 20);
  }
}
