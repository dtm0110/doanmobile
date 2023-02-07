import 'package:job_search/data/local/prefs.dart';

import '../model/account.dart';
import '../model/base/base_response.dart';
import '../remote/account_api.dart';

abstract class AuthRepository {
  Future<BaseResponse<Account>> register(AccountRequest request);

  Future<BaseResponse<Account>> login(AccountRequest request);

  Future<BaseResponse<Account>> updateUserInfo(Account account);

  Future<BaseResponse<Account>> userInfo();

  Future<BaseResponse<Account>> updateUser(Account account);

  void updateUserLocal(Account account);

  Future<Account?> getProfile();

  Future<void> doLogout();
}

class AuthRepositoryImpl extends AuthRepository {
  final Prefs _prefs;
  final AccountAPI _accountAPI;

  AuthRepositoryImpl(this._prefs, this._accountAPI);

  @override
  Future<BaseResponse<Account>> login(AccountRequest request) async {
    var result = await _accountAPI.login(request);
    _prefs.profile = result.data;
    _prefs.accountRequest = request;
    return result;
  }

  @override
  Future<BaseResponse<Account>> register(AccountRequest request) async {
    var result = await _accountAPI.register(request);
    _prefs.profile = result.data;
    _prefs.accountRequest = AccountRequest(
      account: request.account,
      password: request.hash,
    );
    return result;
  }

  Account? get profile => _prefs.profile;

  void updateProfile(Account? account) {
    _prefs.profile = account;
  }

  @override
  Future<BaseResponse<Account>> updateUserInfo(Account account) async {
    var result = await _accountAPI.updateUserInfo(account);
    return result;
  }

  @override
  Future<Account?> getProfile() async {
    return profile;
  }

  @override
  Future<BaseResponse<Account>> userInfo() async =>
      await _accountAPI.userInfo(profile?.id ?? 0);

  @override
  Future<BaseResponse<Account>> updateUser(Account account) async =>
      await _accountAPI.updateUser(account);

  @override
  void updateUserLocal(Account account) {
    _prefs.profile = account;
  }

  @override
  Future<void> doLogout() async {
    await _prefs.cleanAllData();
  }
}
