import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

typedef OnError = void Function(
  dynamic error, {
  String? info,
  bool? sendErrorInfo,
});

//Flavor check!
const String flavor = String.fromEnvironment('app.flavor');

class ApiService {
  factory ApiService() => _instance ??= ApiService._();
  ApiService._();

  static ApiService? _instance;

  final String baseAPI = 'https://api-web.nhle.com/v1';

  //Red Wings Roster
  //https://statsapi.web.nhl.com/api/v1/teams/17/roster

  static const _timeout = 30000;

  OnError? errorCallback;

  Dio _dio() {
    final options = BaseOptions(
      baseUrl: baseAPI,
      connectTimeout: const Duration(milliseconds: _timeout),
      receiveTimeout: const Duration(milliseconds: _timeout),
    );

    final dio = Dio(options);

    return dio;
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return _dio().post<T>(path, data: data);
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    return _dio().get<T>(path);
  }

  void notifyError(dynamic error, {String? info, bool sendErrorInfo = false}) {
    if (errorCallback != null) {
      if (error is DioError) {
        errorCallback!(
          error.error,
          info: error.toString(),
          sendErrorInfo: sendErrorInfo,
        );
      } else {
        errorCallback!(error, info: info, sendErrorInfo: sendErrorInfo);
      }
    } else {
      debugPrint('Api - Error callback not attached');
    }
  }
}
