import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/features/Assignments/data/models/submit_assignment.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../data/models/questions_model.dart';
import '../data/repos/assignments_repo.dart';
import '../presentation/screens/assignments_success.dart';
part 'assignments_state.dart';

class AssignmentsCubit extends Cubit<AssignmentsState> {
  AssignmentsCubit(this.repo) : super(AssignmentsInitial());
  AssignmentsRepo repo ;

 static AssignmentsCubit get(context)=>BlocProvider.of(context);
  PageController pageController =PageController();

  int currentPage =0 ;
  //currentPage= pageController.page!.round() ;

  /// get questions
   List<QuestionsModel> questions =[];
  void getQuestions() async {
    emit(Loading());
    await repo.getAssignments().then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        questions = r;
        emit(Success());
      });
    });
  }

  List<String> numberingOptions=[
    'A','B','C','D','E','F','G','H','I',
  ];
  List<String> optionsId=[];
  /// on select option
  onSelectOption(int index1,int index2,String id){
    questions[index1].questionOptions.forEach((e){
      e.isSelect = false;
    });

    /// add options id when select on it
    if (index1 < optionsId.length) {
      optionsId[index1] = id;
    } else if (index1 == optionsId.length) {
      optionsId.add(id);
    } else {
      print('======= errorrrrrrr');
      /*optionsId.addAll(List.filled(index1 - optionsId.length, ''));
      optionsId.add(id);*/
    }

    print('option id =${optionsId[index1]}');

    /// change container color
    questions[index1]
        .questionOptions[index2].isSelect = !questions[index1]
        .questionOptions[index2].isSelect ;
    emit(Success());
  }

  void submitAssignment(context,{required String id}) async {
      emit(Loading());
      await repo.submitAssignment(SubmitAssignment(
          enrolledId: id,
          optionsId: optionsId)
      ).then((value) {
        value.fold((l) {
          AppDialogs.toast(
            msg: l.message,
            state: ToastStates.error,
          );
          emit(Error(l.message));
        }, (r) {
          showModalBottomSheet(context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible:false ,
            elevation: 1,
            builder: (context)=> AssignmentsSuccess(),
          );
          emit(Success());
        });
      });
  }

}
