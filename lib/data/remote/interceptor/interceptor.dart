import 'dart:io';

import 'package:dio/dio.dart';

import '../../local/prefs.dart';

class Interceptor extends InterceptorsWrapper {
  final Prefs _prefs;
  final String deviceId;

  Interceptor(this._prefs, this.deviceId);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_prefs.authorized) {
      options.headers['Authorization'] = "Bearer ${_prefs.accessToken}";
    }
    options.headers['Content-Type'] = "application/json";
    options.headers['version'] = '1.0';
    options.headers['device-id'] = deviceId;
    if (Platform.isAndroid) {
      options.headers['platform'] = 'ANDROID';
    } else if (Platform.isIOS) {
      options.headers['platform'] = 'IOS';
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
