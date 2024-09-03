part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class Success extends AuthState {}
final class Loading extends AuthState {}
final class LoadingOtp extends AuthState {}
final class Error extends AuthState {}

final class CountdownTick extends AuthState {
 final int count ;
 CountdownTick(this.count);
}
final class CountdownComplete extends AuthState {}
final class CountdownStopped extends AuthState {}


