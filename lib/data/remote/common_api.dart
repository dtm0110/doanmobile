import 'package:job_search/data/model/province.dart';
import 'package:job_search/data/remote/base_api.dart';

import '../../common/network.dart';
import '../model/base/base_response.dart';

class CommonAPI extends BaseAPI {
  CommonAPI(super.networkManager);

  Future<BaseResponse<ProvinceResponse>> provinceList() async {
    final response = await networkManager.request(
      RequestMethod.get,
      '/province/list',
    );
    final data = BaseResponse<ProvinceResponse>.fromJson(
      response.data,
      (data) => ProvinceResponse.fromJson(data as Map<String, dynamic>),
    );
    return data;
  }
}
