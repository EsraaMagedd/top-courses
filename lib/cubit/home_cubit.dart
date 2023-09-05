import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:meta/meta.dart';
import 'package:top_courses/screens/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);
  void updateSelectedIndex(int index) {
    emit(index);
  }
}
