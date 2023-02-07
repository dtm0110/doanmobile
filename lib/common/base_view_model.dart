import 'package:job_search/common/view_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/model/base/base_response.dart';
import 'base_exception.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  bool loading = false;
  ValueNotifier<CommonException?> commonError = ValueNotifier(null);
  ValueNotifier<bool> commonLoading = ValueNotifier(false);

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    setLoading(_state == ViewState.Busy);
    notifyListeners();
  }

  void setLoading(bool loading) {
    this.loading = loading;
  }

  void safeCallApi<T>(Future<BaseResponse<T>> future,
      {Function(T?)? onSuccess,
      ValueNotifier<bool>? loading,
      ValueNotifier<CommonException?>? error,
      Function(CommonException?)? onError,
      Function()? onComplete}) async {
    loading ??= commonLoading;
    error ??= commonError;
    loading.value = true;
    notifyListeners();
    try {
      final BaseResponse<T> response = await future;
      if (response.success) {
        onSuccess?.call(response.data);
      } else {
        CommonException e = CommonException(
            type: ErrorType.SERVER, message: response.message, code: 400);
        error.value = e;
        onError?.call(e);
      }
    } on DioError catch (e) {
      CommonException? ex;
      if (e.response == null) {
        ex = CommonException(type: ErrorType.NETWORK);
      } else if (e.response?.statusCode != null &&
          e.response?.statusCode != 200) {
        final baseErrorMessage = e.response!.data['message'] as String?;
        final googleErrorMessage = e.response!.data['error_message'] as String?;
        ex = CommonException(
            type: ErrorType.SERVER,
            message: baseErrorMessage ?? googleErrorMessage);
      } else {
        ex = CommonException(type: ErrorType.OTHER, message: e.message);
      }
      error.value = ex;
      onError?.call(ex);
    } on CommonException catch (e) {
      error.value = e;
      onError?.call(e);
    } finally {
      loading.value = false;
      onComplete?.call();
      notifyListeners();
    }
  }

  void safeCallOriginApi<T>(Future<T> future,
      {Function(T?)? onSuccess,
      ValueNotifier<bool>? loading,
      ValueNotifier<CommonException?>? error,
      Function(CommonException?)? onError,
      Function()? onComplete}) async {
    loading ??= commonLoading;
    error ??= commonError;
    loading.value = true;
    notifyListeners();
    try {
      final T response = await future;
      if (response != null) {
        onSuccess?.call(response);
      } else {
        CommonException e = CommonException(
            type: ErrorType.SERVER, message: "Error", code: 400);
        error.value = e;
        onError?.call(e);
      }
    } on DioError catch (e) {
      CommonException? ex;
      if (e.response == null) {
        ex = CommonException(type: ErrorType.NETWORK);
      } else if (e.response?.statusCode != null &&
          e.response?.statusCode != 200) {
        final baseErrorMessage = e.response!.data['message'] as String?;
        final googleErrorMessage = e.response!.data['error_message'] as String?;
        ex = CommonException(
            type: ErrorType.SERVER,
            message: baseErrorMessage ?? googleErrorMessage);
      } else {
        ex = CommonException(type: ErrorType.OTHER, message: e.message);
      }
      error.value = ex;
      onError?.call(ex);
    } on CommonException catch (e) {
      error.value = e;
      onError?.call(e);
    } finally {
      loading.value = false;
      onComplete?.call();
      notifyListeners();
    }
  }
}

Future<void> post(Function comp, {int millisecond = 0}) async {
  await Future.delayed(Duration(milliseconds: millisecond), () {});
  comp();
}
