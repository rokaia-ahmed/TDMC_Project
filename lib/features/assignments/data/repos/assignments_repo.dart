import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/questions_model.dart';
import '../models/submit_assignment.dart';

class AssignmentsRepo{
  /// get assignments
  Future<Either<Failure,List<QuestionsModel>>> getAssignments(String id)async{
    try{
      //72BA4502-9DAB-4DAD-98AE-C0D8330E1F2C
      Response response =  await DioHelper.getData(
          url:'${ApiConstants.questions}$id');
      if(response.statusCode==200){
        if(List.from(response.data).isEmpty){
          return left(ServerFailure('assignments.no_questions'.tr()));
        }else{
          List<QuestionsModel> result =[] ;

          List.from(response.data).forEach((item){
            result.add(QuestionsModel.fromJson(item));
          });
          return right(result);
        }
      }else{
        return left(ServerFailure.fromResponse(response));
      }
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
  /// submit Assignment
  Future<Either<Failure, bool>> submitAssignment(SubmitAssignment model) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.SubmitOption,
        data: {
          'enrollmentId': model.enrolledId,
          'workshopEvaluationQuestionOptionId': model.optionsId,
        },
      );
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(ServerFailure.fromResponse(response));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}