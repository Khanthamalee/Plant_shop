import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';

class BaseAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double? height;
  final Widget? content;

  const BaseAppButton(
      {required this.onPressed,
      this.title = '',
      this.height,
      this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? DSH(50)),
          //backgroundColor: AppColors.secondary
        ),
        child: title != ''
            ? Text(title.toString(),
                style: TextStyle(
                    fontSize: DSH(16),
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400))
            : content,
      ),
    );
  }
}
