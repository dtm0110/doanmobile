import 'dart:async';

import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/common/view_state.dart';
import 'package:job_search/data/model/account.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/extension/stream_extension.dart';

import '../../../data/repository/auth_repository.dart';

enum RegisterState {
  emailRequired,
  passwordRequired,
  confirmPasswordRequired,
  passwordNotMatch,
  registerValid,
}

class RegisterViewModel extends BaseViewModel {
  final AccountRequest _request = AccountRequest();
  final AuthRepository _authRepository;
  StreamController<Account> onRegisteredIn = StreamController();
  var _password = '';
  var _rePassword = '';

  RegisterViewModel(this._authRepository);

  void updateEmail(String p0) {
    _request.account = p0;
  }

  void updatePassword(String p0) {
    _password = p0;
  }

  void updateRePassword(String p0) {
    _rePassword = p0;
  }

  RegisterState doRegister() {
    if (_request.account?.isEmpty == true) {
      return RegisterState.emailRequired;
    }

    if (_password.isEmpty == true) {
      return RegisterState.passwordRequired;
    }

    if (_rePassword.isEmpty == true) {
      return RegisterState.confirmPasswordRequired;
    }

    if (_rePassword != _password) {
      return RegisterState.passwordNotMatch;
    }
    _request.hash = _password;
    setState(ViewState.Busy);
    safeCallApi<Account>(
      _authRepository.register(_request),
      onSuccess: (p0) {
        p0?.let((it) => onRegisteredIn.addEventValid(p0));
      },
      onComplete: () {
        setState(ViewState.Idle);
      },
    );

    return RegisterState.registerValid;
  }
}
