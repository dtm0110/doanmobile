import 'package:job_search/data/model/account.dart';
import 'package:job_search/data/model/base/base_response.dart';

import '../../common/network.dart';
import 'base_api.dart';

class AccountAPI extends BaseAPI {
  AccountAPI(super.networkManager);

  Future<BaseResponse<Account>> register(AccountRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      '/auth/register',
      data: request,
    );
    final data = BaseResponse<Account>.fromJson(
      response.data,
      (data) => Account.fromJson(data as Map<String, dynamic>),
    );
    return data;
  }

  Future<BaseResponse<Account>> login(AccountRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      '/auth/login',
      data: request,
    );
    final data = BaseResponse<Account>.fromJson(response.data,
        (data) => Account.fromJson(data as Map<String, dynamic>));
    return data;
  }

  Future<BaseResponse<Account>> userInfo(int userId) async {
    final response = await networkManager.request(
      RequestMethod.get,
      '/user/get-info',
      queryParameters: <String, int>{
        'user_id': userId,
      },
    );
    final data = BaseResponse<Account>.fromJson(response.data,
        (data) => Account.fromJson(data as Map<String, dynamic>));
    return data;
  }

  Future<BaseResponse<Account>> updateUserInfo(Account account) async {
    final response = await networkManager.request(
        RequestMethod.get, "/user/update-info",
        queryParameters: account.toJson());
    // final result =
    //     BaseResponse<bool>.fromJson(response.data, (data) => data as bool);
    final result = BaseResponse<Account>.fromJson(response.data,
        (data) => Account.fromJson(data as Map<String, dynamic>));
    return result;
  }

  Future<BaseResponse<Account>> updateUser(Account account) async {
    final response = await networkManager.request(
        RequestMethod.get, "/user/update",
        queryParameters: account.toJson());
    // final result =
    //     BaseResponse<bool>.fromJson(response.data, (data) => data as bool);
    final result = BaseResponse<Account>.fromJson(response.data,
        (data) => Account.fromJson(data as Map<String, dynamic>));
    return result;
  }
}
