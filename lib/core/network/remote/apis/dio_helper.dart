import 'package:dio/dio.dart';
import 'dio_interceptors.dart';
import '../end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 500,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(minutes: 2),
      ),
    );

    /// DIO [HEADERS]
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };

    /// DIO [INTERCEPTORS]
    dio!.interceptors.addAll({
      AppInterceptors(dio!),
      LogInterceptor(responseBody: true, requestBody: true),
    });
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.post(url, data: data, queryParameters: query);
  }

  /// METHOD [GET] DATA FROM API
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.get(url, queryParameters: query,data:data );
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> updateData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.put(url, data: data, queryParameters: query);
  }

  /// METHOD [DELETE] DATA FROM API
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.delete(url, queryParameters: query);
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.patch(url, data: data, queryParameters: query);
  }
}
