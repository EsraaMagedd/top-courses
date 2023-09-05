part of 'all_category_cubit.dart';

@immutable
abstract class AllCategoryState {}

class AllCategoryInitial extends AllCategoryState {}

class ContextState {
  final int currentIndex;
  ContextState(this.currentIndex);
}

class SelectedState {
  final int selected_index;
  SelectedState(this.selected_index);
}
