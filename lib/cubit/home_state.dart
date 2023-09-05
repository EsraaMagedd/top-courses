part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {


}
class ContextState {
  final int selectedindex;
  ContextState(this.selectedindex);
}


