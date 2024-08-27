part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}
final class Success extends HomeState {}
final class SearchSuccess extends HomeState {}
final class SearchError extends HomeState {
  final String errorMsg ;
  SearchError(this.errorMsg);
}
final class Error extends HomeState {
  final String errorMsg ;
  Error(this.errorMsg);
}

