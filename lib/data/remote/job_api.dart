import 'package:job_search/common/network.dart';
import 'package:job_search/data/model/career_response.dart';
import 'package:job_search/data/remote/base_api.dart';

import '../model/base/base_response.dart';
import 'major_response.dart';
import '../model/filter_arguments.dart';

class JobApi extends BaseAPI {
  JobApi(super.networkManager);

  Future<BaseResponse<CareerResponse>> getListCareer(
      FilterArguments arguments) async {
    final response = await networkManager.request(
        RequestMethod.get, "/career-detail/list-advance",
        queryParameters: arguments.toJson());

    final data = BaseResponse<CareerResponse>.fromJson(response.data,
        (json) => CareerResponse.fromJson(json as Map<String, dynamic>));
    return data;
  }

  Future<BaseResponse<CareerResponse>> getListCareerApplied(int userId) async {
    final response = await networkManager.request(
        RequestMethod.get, "/career-detail/list-apply",
        queryParameters: <String, int>{'user_id': userId});

    final data = BaseResponse<CareerResponse>.fromJson(response.data,
        (json) => CareerResponse.fromJson(json as Map<String, dynamic>));
    return data;
  }

  Future<BaseResponse<CareerResponse>> getListCareerSaved(int userId) async {
    final response = await networkManager.request(
        RequestMethod.get, "/career-detail/list-saved",
        queryParameters: <String, int>{'user_id': userId});

    final data = BaseResponse<CareerResponse>.fromJson(response.data,
        (json) => CareerResponse.fromJson(json as Map<String, dynamic>));
    return data;
  }

  Future<BaseResponse<dynamic>> applyCareer(int careerId, int userId) async {
    final response = await networkManager.request(
      RequestMethod.get,
      "/career-detail/apply",
      queryParameters: <String, int>{
        'career_detail_id': careerId,
        'user_id': userId
      },
    );

    final data = BaseResponse<dynamic>.fromJson(response.data, (json) => json);
    return data;
  }

  Future<BaseResponse<dynamic>> saveCareer(int careerId, int userId) async {
    final response = await networkManager.request(
      RequestMethod.get,
      "/career-detail/saved",
      queryParameters: <String, int>{
        'career_detail_id': careerId,
        'user_id': userId
      },
    );

    final data = BaseResponse<dynamic>.fromJson(response.data, (json) => json);
    return data;
  }

  Future<BaseResponse<MajorResponse>> getListMajor() async {
    final response =
        await networkManager.request(RequestMethod.get, "/career/list");
    final data = BaseResponse<MajorResponse>.fromJson(response.data,
        (json) => MajorResponse.fromJson(json as Map<String, dynamic>));
    return data;
  }
}
