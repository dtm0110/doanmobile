import 'package:job_search/common/network.dart';
import 'package:job_search/data/remote/base_api.dart';
import 'package:job_search/data/remote/province_response.dart';

import '../model/base/base_response.dart';

class ProvinceApi extends BaseAPI {
  ProvinceApi(super.networkManager);

  Future<BaseResponse<ProvinceResponse>> getListProvince() async {
    final response =
        await networkManager.request(RequestMethod.get, "/province/list");
    final data = BaseResponse<ProvinceResponse>.fromJson(response.data,
        (json) => ProvinceResponse.fromJson(json as Map<String, dynamic>));
    return data;
  }
}
