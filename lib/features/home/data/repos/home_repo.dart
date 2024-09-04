import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/workshops_model.dart';

class HomeRepo{
  /// get workshops
  Future<Either<Failure,WorkShopsModel>> getWorkShops()async{
    try{
      Response response =  await DioHelper.getData(
          url:ApiConstants.workshops);
      if(response.statusCode==200){
        if(response.data['success']==false){
          return left(ServerFailure('No WorkShops found'));
        }else{
          var result = WorkShopsModel.fromJson(response.data);
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

  Future<Either<Failure, bool>> withdraw(String id) async {
    try {
      Response response = await DioHelper.patchData(
        url: '${ApiConstants.withdraw}/$id',
      );
      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(ServerFailure('there is an error occurred'));
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