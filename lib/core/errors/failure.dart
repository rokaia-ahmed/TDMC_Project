import 'package:dio/dio.dart';

 class Failure{
  final String message ;

  Failure(this.message);
}
class ServerFailure extends Failure{
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e){
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
       return ServerFailure('You hove weak internet');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with api server');
      case DioExceptionType.badResponse:
        return  ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an error, please try again');
    }
  }
  /////////////////////////////////////////////////////////////////
  factory ServerFailure.fromResponse(Response<dynamic> response){
     if(response.statusCode ==404){
       return ServerFailure('Your request was not found, please try later');
     }else if(response.statusCode == 500){
       return ServerFailure('there is a problem  with server, please try later');
     }else if(response.statusCode == 400 ){
       return ServerFailure(response.data['message']);
     } else if(response.statusCode ==403){
       return ServerFailure(response.data['codes']);
     } else if(response.statusCode == 401){
       return ServerFailure('not authorization');
     }
     else{
       return ServerFailure('there was an error, please try again');
     }
  }
}
