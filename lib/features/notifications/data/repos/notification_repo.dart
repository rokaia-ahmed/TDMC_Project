import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tdmc_project/features/notifications/data/models/notification_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';
import '../models/enrollAndRejectBody.dart';
import '../models/invitations_model.dart';

class NotificationRepo{
  /// get Notification
  Future<Either<Failure,List<NotificationModel>>> getNotification()async{
    try{
      Response response =  await DioHelper.getData(
          url:ApiConstants.notifications);
      if(response.statusCode==200){
        List<NotificationModel> list = [];
        List.from(response.data).forEach((e){
          list.add(NotificationModel.fromJson(e));
        });
        return right(list) ;
      } else{
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

  /// mark notification read
  Future<Either<Failure, bool>> markRead(
      String id) async {
    try {
      Response response = await DioHelper.postData(
        url: '${ApiConstants.makeRead}?Id=$id',
      );
      if (response.statusCode == 204) {
        return right(true);
      }else {
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

  /// mark all read
  Future<Either<Failure, bool>> markAllRead() async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.makeAllRead,
      );
      if (response.statusCode == 204) {
        return right(true);
      }else {
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

  /// get invitation
  Future<Either<Failure,List<InvitationModel>>>
  getInvitation(String id)async{
    try{
      Response response =  await DioHelper.getData(
          url:'${ApiConstants.invitations}$id');
      if(response.statusCode==200){
        List<InvitationModel> list = [];
        List.from(response.data).forEach((e){
          list.add(InvitationModel.fromJson(e));
        });
        return right(list) ;
      } else{
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

  /// enrolled or reject
  Future<Either<Failure, bool>>
  enrolledOrReject(EnrollAndRejectBody model) async {
    try {
      Response response = await DioHelper.patchData(
        url: '${ApiConstants.enrollAndReject}${model.id}',
        data: {
          "id":model.id,
          "workshopId":model.workshopId,
          "rejectionReason":model.rejectReason,
          "status":model.status,
        },
      );
      if (response.statusCode == 200) {
        return right(true);
      }else if(response.statusCode ==400){
        return left(ServerFailure('something wrong'));
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