import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'assignments_state.dart';

class AssignmentsCubit extends Cubit<AssignmentsState> {
  AssignmentsCubit() : super(AssignmentsInitial());

 static AssignmentsCubit get(context)=>BlocProvider.of(context);
  PageController pageController =PageController();
}
