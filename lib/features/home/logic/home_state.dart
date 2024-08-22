part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}
final class Success extends HomeState {}
final class Error extends HomeState {}
