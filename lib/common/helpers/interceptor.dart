import 'package:dio/dio.dart';

import 'dio_exception.dart';


class DioInterceptor extends Interceptor {


  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {

    final checkUnauthorized = !err.requestOptions.headers.containsKey('check_token');
    if (err.response?.statusCode == 401) {

    }
    return handler.reject(
      DioExceptionX(
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        serverError: err.response?.data ?? {},
        errorType: err.type,
        checkUnauthorized: checkUnauthorized,
      ),
    );
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {


    options.path = options.path.replaceAll(RegExp(r'/[{][A-Za-z_]+\}+'), '');
    return super.onRequest(options, handler);
  }

}
