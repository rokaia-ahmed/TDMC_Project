import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../data/models/questions_model.dart';
import '../data/models/submit_assignment.dart';
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
 AssignmentsModel? assignmentsModel ;
  List<QuestionsModel> questions =[] ;
  void getQuestions(String id) async {
    emit(Loading());
    await repo.getAssignments(id).then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        assignmentsModel = r;
        questions = assignmentsModel!.questionsList! ;
        emit(Success());
      });
    });
  }

  List<String> numberingOptions=[
    'A','B','C','D','E','F','G','H','I',
  ];
  int count = 0 ;
  List<String> optionsId=[];
  Map<int,String> mapOptions={};
  /// on select option
  onSelectOption(int index1,int index2,String id){
    questions[index1].questionOptions.forEach((e){
      e.isSelect = false;
    });

    /// add options id when select on it

    mapOptions[index1]=id;
    count =mapOptions.values.length;

    removeFromUnanswered(index1);

    /// change container color
    questions[index1]
        .questionOptions[index2].isSelect = !questions[index1]
        .questionOptions[index2].isSelect ;
    emit(Success());
  }
  addMapValueToList(){
    List<String> list = mapOptions.values.toList();
    optionsId = list ;
    emit(Success());
  }

  List<int> unansweredList =[];
  addUnansweredToList(int indexQuestion){
    if ((!mapOptions.containsKey(indexQuestion))&&
        !unansweredList.contains(questions.length)) {
      unansweredList.add(indexQuestion+1);
    }
    emit(Success());
  }

  removeFromUnanswered(int indexQuestion){
    if(mapOptions.containsKey(indexQuestion)&&
        unansweredList.contains(indexQuestion+1)){
      unansweredList.remove(indexQuestion+1);
    }
    emit(Success());
  }

  void submitAssignment(context,{required String id}) async {
      emit(Loading());
      await repo.submitAssignment(SubmitAssignment(
          enrolledId: id,
          optionsId:optionsId)
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
            builder: (context)=> AssignmentsSuccess(),
          );
          emit(Success());
        });
      });
  }

}
