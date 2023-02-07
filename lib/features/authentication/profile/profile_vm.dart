import 'dart:async';

import 'package:job_search/common/base_view_model.dart';
import 'package:job_search/data/model/account.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/extension/stream_extension.dart';
import 'package:job_search/extension/string_extension.dart';

import '../../../common/view_state.dart';
import '../../../data/model/major.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/career_repository.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthRepository _authRepository;
  final CareerRepository _careerRepository;

  ProfileViewModel(this._authRepository, this._careerRepository);

  StreamController<Account> onLoggedIn = StreamController();

  List<Major> majors = [];
  Major? currentMajor;
  Account? account;
  List<String> genders = [];
  String? pathImage;

  initData() {
    genders = ['Male', 'FeMale'];
    getAccount();
    getListMajor();
    currentMajor = Major(name: account?.career);
  }

  void getListMajor() async {
    var majorResponse = await _careerRepository.getListMajor();
    majors.clear();
    majors.addAll(majorResponse.data?.data ?? []);
    notifyListeners();
  }

  void getAccount() {
    setState(ViewState.Busy);
    safeCallApi(
      _authRepository.userInfo(),
      onSuccess: (p0) {
        account = p0 as Account?;
        p0?.let((it) => _authRepository.updateUserLocal(it));
      },
      onComplete: () {
        setState(ViewState.Idle);
      },
    );
  }

  void updatePathAvatar(String? path) {
    pathImage = path;
    notifyListeners();
  }

  updateCurrentMajor(Major item) {
    currentMajor = item;
    account?.career = item.name;
    notifyListeners();
  }

  void updateBirthDay(DateTime date) {
    account?.birthday = date
        .toString()
        .convertDateFormat("yyyy-MM-dd HH:mm:sss.sssss", "dd-MM-yyyy");
    notifyListeners();
  }

  DateTime dob() => account?.birthday?.toDate("dd-MM-yyyy") ?? DateTime.now();

  updateGender(String value) {
    account?.gender = value;
    notifyListeners();
  }

  void updateProfile() {
    account?.let((it) {
      setState(ViewState.Busy);
      safeCallApi<Account>(
        _authRepository.updateUser(it.getUserUpdate()),
        error: null,
        onComplete: () {
          safeCallApi<Account>(
            _authRepository.updateUserInfo(it.getUpdateCVRequest()),
            onSuccess: (po) {
              // po?.let((it) {
              //   _authRepository.updateUserInfo(it);
              onLoggedIn.addEventValid(it);
              // });
            },
            onComplete: () {
              getAccount();
            },
          );
        },
      );
    });
  }

  Future<void> logout() async {
    await _authRepository.doLogout();
  }
}
