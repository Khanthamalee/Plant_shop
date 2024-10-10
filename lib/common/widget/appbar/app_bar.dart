import 'package:flutter/material.dart';
import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  const BasicAppBar(
      {this.title,
      this.action,
      this.backgroundColor,
      this.hideBack = false,
      super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: DSH(50),
                width: DSH(50),
                decoration: const BoxDecoration(
                    color: AppColors.secondary, shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: DSH(15),
                  color: AppColors.primary,
                ),
              )),
    );
  }
}
