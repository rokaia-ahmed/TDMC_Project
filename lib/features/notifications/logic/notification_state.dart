part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class Loading extends NotificationState {}
final class LoadingEnroll extends NotificationState {}
final class LoadingReject extends NotificationState {}
final class Success extends NotificationState {}
final class Error extends NotificationState {
  final String errorMsg ;
  Error(this.errorMsg);
}
