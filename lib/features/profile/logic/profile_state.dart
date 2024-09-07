part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ChangeLanguageState extends ProfileState {}

final class Loading extends ProfileState {}
final class Success extends ProfileState {}
final class LanguageSwitched extends ProfileState {}
final class Error extends ProfileState {
  final String errorMsg ;
  Error(this.errorMsg);
}
