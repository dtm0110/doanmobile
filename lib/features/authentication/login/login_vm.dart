import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/common/view_state.dart';
import 'package:job_search/data/model/account.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/extension/stream_extension.dart';
import 'package:job_search/extension/string_extension.dart';

import '../../../data/repository/auth_repository.dart';

class LoginViewModel extends BaseViewModel {
  final loginRequest = AccountRequest();
  StreamController<Account> onLoggedIn = StreamController();

  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  void updateEmail(String email) {
    loginRequest.account = email;
  }

  void updatePassword(String password) {
    loginRequest.password = password;
  }

  void doLogin() {
    setState(ViewState.Busy);
    if (kDebugMode && loginRequest.account.emptyOrNull) {
      loginRequest.account = 'trungtran24h@gmail.com';
      loginRequest.password = '12345678';
    }
    safeCallApi<Account>(
      _authRepository.login(loginRequest),
      onSuccess: (p0) {
        p0?.let((it) => onLoggedIn.addEventValid(it));
      },
      onComplete: () {
        setState(ViewState.Idle);
      },
    );
  }
}
