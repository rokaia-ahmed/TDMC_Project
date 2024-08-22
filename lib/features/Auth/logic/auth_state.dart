part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class Success extends AuthState {}
final class Loading extends AuthState {}
final class Error extends AuthState {}
