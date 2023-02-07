import 'package:job_search/data/remote/common_api.dart';
import '../model/base/base_response.dart';
import '../model/province.dart';

abstract class ProvinceRepository {
  Future<BaseResponse<ProvinceResponse>> provinceList();
}

class ProvinceRepositoryImpl extends ProvinceRepository {
  final CommonAPI _commonAPI;

  ProvinceRepositoryImpl(this._commonAPI);

  @override
  Future<BaseResponse<ProvinceResponse>> provinceList() async =>
      await _commonAPI.provinceList();
}
