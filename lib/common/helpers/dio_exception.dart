import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

class DioExceptionX extends DioException {
  DioExceptionX({
    required super.requestOptions,
    dynamic super.error,
    this.statusCode,
    this.serverError,
    this.checkUnauthorized = true,
    this.errorType = DioExceptionType.unknown,
  }) : super(type: errorType);

  final int? statusCode;
  final dynamic serverError;
  final bool checkUnauthorized;
  final DioExceptionType errorType;

  @override
  String toString() {
    if (error != null) {
      if (kDebugMode) {
        print("ERROR:##########################");
        print(error.toString());
        print("ERROR:##########################");
      }
      return error.toString();
    } else {
      return _getServerError();
    }
  }

  String _getServerError() {
    try {
      if (checkUnauthorized && statusCode == 401) {
        if (kDebugMode) {
          print("ERROR:##########################");
          print(statusCode);
          print("ERROR:##########################");
        }

        return 'Unauthorized';
      } else {
        if ((statusCode ?? 0) >= 500) {
          if (kDebugMode) {
            print("ERROR:##########################");
            print(serverError);
            print(statusCode);
            print("ERROR:##########################");
          }
          return tr('errors.no_connection_to_server');
        } else {
          if (serverError['error'] != null) {
            final message = serverError['error'];

            if (kDebugMode) {
              print("ERROR:##########################");
              print(message);
              print(statusCode);

              print("ERROR:##########################");
            }

            return message;
          } else if (serverError['error'] != null) {
            return serverError['error'];
          } else {
            return serverError.toString();
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("ERROR:##########################");
        print(e.toString());            print(statusCode);

        print("ERROR:##########################");
      }
      return tr('errors.something_went_wrong');
    }
  }
}
