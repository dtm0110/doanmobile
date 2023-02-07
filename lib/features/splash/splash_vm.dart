import 'package:job_search/common/base_view_model.dart';
import 'package:flutter/material.dart';

enum SplashState { none, authorized, unauthorized }

class SplashViewModel extends BaseViewModel {
  SplashState authState = SplashState.unauthorized;

  SplashViewModel();

  Future<void> startSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      authState = SplashState.none;
      return;
    });
  }
}
