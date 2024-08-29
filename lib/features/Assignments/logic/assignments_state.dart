part of 'assignments_cubit.dart';

@immutable
sealed class AssignmentsState {}

final class AssignmentsInitial extends AssignmentsState {}

final class Loading extends AssignmentsState {}
final class SubmitLoading extends AssignmentsState {}
final class Success extends AssignmentsState {}
final class Error extends AssignmentsState {
  final String errorMsg ;
  Error(this.errorMsg);
}
