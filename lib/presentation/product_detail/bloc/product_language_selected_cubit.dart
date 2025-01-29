import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLanguageSelectedCubit extends Cubit<int> {
  ProductLanguageSelectedCubit() : super(0);
  int selectedIndex = 0;
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
