import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/local/cache/cache_helper.dart';
import '../../../../core/network/remote/apis/dio_helper.dart';
import '../../../../core/network/remote/end_points.dart';

class AuthRepo {
  /// sign in
  Future<Either<Failure, bool>> login(String phone) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.login,
        data: {
          'phoneNumber': phone,
        },
      );
      if (response.statusCode == 200) {
        return right(true);
      } else if (response.statusCode == 400) {
        return left(Failure('Invalid code or phone number'));
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

  /// otp
  Future<Either<Failure, bool>> otp(String phone, String otp) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.otp,
        data: {
          'phoneNumber': phone,
          'code': otp,
        },
      );
      if (response.statusCode == 200) {
        CacheHelper.saveData('token', response.data['token']);
        CacheHelper.saveData('userName', response.data['user']['userName']);
        return right(true);
      } else if (response.statusCode == 400) {
        return left(Failure('Invalid otp'));
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

  Future<Either<Failure, bool>> resentOtp(String phone) async {
    try {
      Response response = await DioHelper.postData(
        url: ApiConstants.resentOtp,
        data: {
          'phoneNumber': phone,
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
