import 'dart:convert';

import 'package:job_search/extension/bool_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/account.dart';

class Prefs {
  static const String keyProfile = "keyProfile";
  static const String keyAccountRequest = "keyAccountRequest";
  static const String keyIdToken = "keyIdToken";
  static const String keyAccessToken = "keyAccessToken";
  static const String keyHasOTP = "keyHasOTP";

  final SharedPreferences _sharedPreferences;

  Prefs(this._sharedPreferences);

  Account? get profile {
    String? profileJson = _sharedPreferences.getString(keyProfile);
    if (profileJson != null && profileJson.isNotEmpty) {
      return Account.fromJson(json.decode(profileJson));
    }
    return null;
  }

  set profile(Account? account) {
    _sharedPreferences.setString(
        keyProfile, account == null ? "" : json.encode(account.toJson()));
  }

  AccountRequest? get accountRequest {
    String? profileJson = _sharedPreferences.getString(keyAccountRequest);
    if (profileJson != null && profileJson.isNotEmpty) {
      return AccountRequest.fromJson(json.decode(profileJson));
    }
    return null;
  }

  set accountRequest(AccountRequest? account) {
    _sharedPreferences.setString(
      keyAccountRequest,
      account == null ? "" : json.encode(account.toJson()),
    );
  }

  bool get hasOTP => _sharedPreferences.getBool(keyHasOTP).isTrue;

  set hasOTP(bool? hasToken) {
    _sharedPreferences.setBool(keyHasOTP, hasToken ?? false);
  }

  void updateToken(String? idToken, String? accessToken) {
    if (idToken == null || accessToken == null) {
      _sharedPreferences.remove(keyIdToken);
      _sharedPreferences.remove(keyAccessToken);
      return;
    }
    _sharedPreferences.setString(keyIdToken, idToken);
    _sharedPreferences.setString(keyAccessToken, accessToken);
  }

  bool get authorized {
    return _sharedPreferences.getString(keyAccessToken)?.isNotEmpty ?? false;
  }

  Future<void> cleanAllData() async {
    await _sharedPreferences.clear();
  }

  String get accessToken {
    return _sharedPreferences.getString(keyAccessToken) ?? "";
  }

  String get idToken {
    return _sharedPreferences.getString(keyIdToken) ?? "";
  }
}
