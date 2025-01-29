import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../../responsive/dimension.dart';
import '../bloc/product_language_selected_cubit.dart';

class ProductLanguage extends StatelessWidget {
  List<String> language;
  ProductLanguage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.5,
      child: Padding(
        padding: EdgeInsets.only(top: DSH(15)),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: language.length,
          separatorBuilder: (context, index) => _height(context),
          itemBuilder: (context, index) =>
              BlocBuilder<ProductLanguageSelectedCubit, int>(
            builder: (context, state) => GestureDetector(
                onTap: () {
                  context
                      .read<ProductLanguageSelectedCubit>()
                      .itemSelection(index);
                  Navigator.pop(context);
                },
                child: state == index
                    ? _languagebutton(context, language[index],
                        AppColors.backgroundsecondary, Icons.check_box_outlined)
                    : _languagebutton(context, language[index],
                        AppColors.background, Icons.check_box_outline_blank)),
          ),
        ),
      ),
    );
  }

  Widget _height(BuildContext context) {
    return WH(context, 10);
  }

  Widget _languagebutton(
      BuildContext context, String language, Color? color, IconData? icon) {
    return Container(
      height: DSH(60),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: DSH(16)),
      padding: EdgeInsets.only(
          top: DSH(15), bottom: DSH(15), left: DSW(12), right: DSW(12)),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(DSH(100))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,
              style: TextStyle(
                fontSize: DSH(16),
              )),
          Icon(
            icon,
            size: 30,
          )
        ],
      ),
    );
  }
}
