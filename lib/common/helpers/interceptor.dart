import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import 'dio_exception.dart';

class DioInterceptor extends Interceptor {

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // REQUEST LOG
    print('🔵 ═══════════════════════════════════════════════════════════');
    print('🔵 REQUEST: ${options.method} ${options.uri}');
    print('🔵 Headers: ${options.headers}');
    print('🔵 Data: ${options.data}');
    print('🔵 ═══════════════════════════════════════════════════════════');

    options.path = options.path.replaceAll(RegExp(r'/[{][A-Za-z_]+\}+'), '');
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    // RESPONSE LOG
    print('✅ ═══════════════════════════════════════════════════════════');
    print('✅ RESPONSE [${response.statusCode}]: ${response.requestOptions.uri}');
    print('✅ Data type: ${response.data.runtimeType}');
    print('✅ Data: ${response.data}');
    print('✅ ═══════════════════════════════════════════════════════════');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // ERROR LOG
    print('❌ ═══════════════════════════════════════════════════════════');
    print('❌ ERROR: ${err.requestOptions.method} ${err.requestOptions.uri}');
    print('❌ Status Code: ${err.response?.statusCode}');
    print('❌ Error Type: ${err.type}');
    print('❌ Response Data: ${err.response?.data}');
    print('❌ Error Message: ${err.message}');
    print('❌ ═══════════════════════════════════════════════════════════');

    final checkUnauthorized = !err.requestOptions.headers.containsKey('check_token');
    if (err.response?.statusCode == 401) {
      // 401 logic
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
}