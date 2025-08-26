import 'dart:async';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:bozorlik/app/router.dart';
import 'package:toastification/toastification.dart';

import '../../db/cache.dart';

import '../../features/auth/repositories/auth_repository.dart';
import '../exceptions/failure.dart';

bool isTokenExpired(String token) {
  return JwtDecoder.isExpired(token);
}

class RequestHelper {
  final logger = Logger();
  final baseUrl = 'https://backend.marketveb.uz';
  final dio = Dio();
  Completer<void>? _refreshCompleter;

  RequestHelper() {
    dio.interceptors.add(AppInterceptor());
  }

  String? get _token {
    final token = cache.getString('access_token');

    return token;
  }

  Future<void> _refreshToken() async {
    if (kDebugMode) {
      logger.d('Unauthorized. Attempting to refresh token...');
    }
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      await _refreshCompleter!.future;
      return;
    }

    _refreshCompleter = Completer();

    try {
      final success = await authRepository.refreshToken();
      if (success) {
        logger.d('User token refreshed successfully');
        _refreshCompleter?.complete();
      } else {
        logger.e('Failed to refresh user token');
        _refreshCompleter?.completeError(UnauthorizedException());
        _navigateToRegister();
        throw UnauthorizedException();
      }
    } catch (e, s) {
      logger.e('Error during token refresh: $e', error: e, stackTrace: s);
      _refreshCompleter?.completeError(e);
      _navigateToRegister();
      throw UnauthorizedException();
    } finally {
      _refreshCompleter = null;
    }
  }

  void _navigateToRegister() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.go(AppRoutes.login);
    });
  }

  Future<dynamic> _handleRequest(Future<Response> Function() request) async {
    try {
      if (isTokenExpired(_token ?? "")) {
        await _refreshToken();
      }
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      // showCustomToast(
      //   title: e.response?.data["message"] ?? "Something went wrong",
      //   type: ToastificationType.error,
      // );
      if (e.response?.statusCode == 401) {
        if (kDebugMode) {
          logger.d('Token expired. Refreshing token...');
        }
        try {
          await _refreshToken();
          final response = await request();
          return response.data;
        } catch (e, s) {
          throw UnauthorizedException();
        }
      } else if (e.response?.statusCode == 502) {
        throw ServerFailure(e.response?.statusCode);
      }
      if (e.type == DioExceptionType.connectionError) {
        throw const ConnectionFailure();
      }
      if (kDebugMode) {
        // logger.e(
        //   'Failed to make request: ${e.response?.realUri.path} ${e.response
        //       ?.data ?? e.message}',
        // );
      }
      throw UnknownFailure(e.response?.statusCode);
    } catch (e, s) {
      _navigateToRegister();
    }
  }

  // Public methods

  Future<dynamic> get(
    String path, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get(baseUrl + path, cancelToken: cancelToken);

      if (log && kDebugMode) {
        logger.d([
          'GET',
          path,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response.data;
    } on DioException catch (e, s) {
      // showCustomToast(
      //   title: e.response?.data["message"] ?? "Something went wrong",
      //   type: ToastificationType.error,
      // );
      if (log && kDebugMode) {
        logger.e('GET request failed: $e', error: e, stackTrace: s);
      }
      rethrow;
    }
  }

  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    FormData? formData,
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.post(
        baseUrl + path,
        data: formData ?? body,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (log && kDebugMode) {
        logger.d([
          'POST',
          path,
          body,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response.data;
    } on DioException catch (e, s) {
      // showCustomToast(
      //   title: e.response?.data["message"] ?? "Something went wrong",
      //   type: ToastificationType.error,
      // );
      if (log && kDebugMode) {
        logger.e('POST request failed: $e', error: e, stackTrace: s);
      }
      rethrow;
    }
  }

  Future<dynamic> getWithAuth(
    String path, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() async {
      final response = await dio.get(
        baseUrl + path,
        cancelToken: cancelToken,
        options: Options(headers: {'Authorization': 'Bearer $_token'}),
      );

      if (log && kDebugMode) {
        logger.d([
          'GET',
          path,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response;
    });
  }

  Future<dynamic> postWithAuth(
    String path,
    Map<String, dynamic> body, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() async {
      final response = await dio.post(
        baseUrl + path,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (log && kDebugMode) {
        logger.d([
          'POST',
          path,
          body,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response;
    });
  }

  Future<dynamic> putWithAuth(
    String path,
    Map<String, dynamic> body, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() async {
      final response = await dio.put(
        baseUrl + path,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (log && kDebugMode) {
        logger.d([
          'PUT',
          path,
          body,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response;
    });
  }

  Future<dynamic> patchWithAuth(
    String path,
    Map<String, dynamic> body, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() async {
      final response = await dio.patch(
        baseUrl + path,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (log && kDebugMode) {
        logger.d([
          'PATCH',
          path,
          body,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response;
    });
  }

  Future<dynamic> patch(
    String path,
    Map<String, dynamic> body, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.patch(
        baseUrl + path,
        data: body,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e, s) {
      // showCustomToast(
      //   title: e.response?.data["message"] ?? "Something went wrong",
      //   type: ToastificationType.error,
      // );
      if (log && kDebugMode) {
        logger.e('PATCH request failed: $e', error: e, stackTrace: s);
      }
      rethrow;
    }
  }

  Future<dynamic> deleteWithAuth(
    String path, {
    bool log = false,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() async {
      final response = await dio.delete(
        baseUrl + path,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (log && kDebugMode) {
        logger.d([
          'DELETE',
          path,
          response.statusCode,
          response.statusMessage,
          response.data,
        ]);
      }

      return response;
    });
  }

  Future<Response> download({
    required String path,
    required String savingPath,
  }) async {
    return dio.download(
      path,
      savingPath,
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
      onReceiveProgress: (progress, _) {
        print(progress);
      },
    );
  }
}

final requestHelper = RequestHelper();

class AppInterceptor extends Interceptor {
  final logger = Logger();

  void logLong(String text) {
    const chunkSize = 800;
    for (var i = 0; i < text.length; i += chunkSize) {
      logger.d(
        text.substring(
          i,
          i + chunkSize > text.length ? text.length : i + chunkSize,
        ),
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logLong("RESPONSE[${response.statusCode}] => PATH: ${response.realUri}");
    logLong("DATA: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logLong(
      "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}            DATA: ${err.response?.data ?? err.message}",
    );

    super.onError(err, handler);
  }
}
