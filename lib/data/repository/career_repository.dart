import 'dart:developer';

import 'package:job_search/data/local/prefs.dart';
import 'package:job_search/data/model/career_response.dart';
import 'package:job_search/data/model/filter_arguments.dart';
import 'package:job_search/data/remote/job_api.dart';
import 'package:job_search/data/remote/major_response.dart';

import '../model/base/base_response.dart';

abstract class CareerRepository {
  Future<BaseResponse<CareerResponse>> getListCareer(
    FilterArguments params,
  );

  Future<BaseResponse<dynamic>> applyCareer(int careerId);

  Future<BaseResponse<dynamic>> saveCareer(int careerId);

  Future<BaseResponse<CareerResponse>> getListCareerApplied();

  Future<BaseResponse<CareerResponse>> getListCareerSaved();

  Future<BaseResponse<MajorResponse>> getListMajor();
}

class CareerRepositoryImpl extends CareerRepository {
  final JobApi api;
  final Prefs _prefs;

  CareerRepositoryImpl(this.api, this._prefs);

  @override
  Future<BaseResponse<CareerResponse>> getListCareer(
    FilterArguments params,
  ) {
    params.userId = _prefs.profile?.id;
    return api.getListCareer(params);
  }

  @override
  Future<BaseResponse<dynamic>> applyCareer(int careerId) async =>
      await api.applyCareer(
        careerId,
        _prefs.profile?.id ?? 0,
      );

  @override
  Future<BaseResponse<dynamic>> saveCareer(int careerId) async =>
      await api.saveCareer(
        careerId,
        _prefs.profile?.id ?? 0,
      );

  @override
  Future<BaseResponse<CareerResponse>> getListCareerApplied() async =>
      await api.getListCareerApplied(
        _prefs.profile?.id ?? 0,
      );

  @override
  Future<BaseResponse<CareerResponse>> getListCareerSaved() async =>
      await api.getListCareerSaved(
        _prefs.profile?.id ?? 0,
      );

  @override
  Future<BaseResponse<MajorResponse>> getListMajor() async =>
      await api.getListMajor();
}
