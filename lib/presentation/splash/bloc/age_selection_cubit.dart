import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');

  String selecteAge = "";
  void selectAge(String age) {
    selecteAge = age;
    emit(selecteAge);
  }
}
