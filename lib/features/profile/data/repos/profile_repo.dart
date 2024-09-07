import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tdmc_project/features/profile/data/models/profile_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';

class ProfileRepo{
  /// get profile data
  Future<Either<Failure,ProfileModel>> getWorkShops()async{
    try{
      Response response =  await DioHelper.getData(
          url:ApiConstants.GetProfile);
      if(response.statusCode==200){
          var result = ProfileModel.fromJson(response.data);
          return right(result);
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

}