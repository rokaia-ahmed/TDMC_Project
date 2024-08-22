import 'package:dio/dio.dart';

import '../../local/cache/cache_helper.dart';

/// AN INTERCEPTORS THAT HANDLES THE ERROR RESPONSES FROM A [DIO] REQUEST.
class AppInterceptors extends Interceptor {
  AppInterceptors(this.dio);


  /// THE [Dio] INSTANCE USED TO HANDLE ALL REQUEST.
  final Dio dio;

  /// ON [REQUEST] API
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// GET TOKEN FROM CACHE

    final String? token = CacheHelper.getData('token');

    if (token != null) {
      options.headers['Authorization'] = 'Token $token';
    }

    return handler.next(options);
  }

  /// ON [RESPONSE] API
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
     return handler.next(response);
  }

}
