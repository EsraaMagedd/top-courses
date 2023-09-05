import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<int> {
  AllCategoryCubit() : super(0);
  void updateSelectedIndex(int index) {
    emit(index);
  }
  void updateCurrentIndex(int index) {
    emit(index);
  }




}
