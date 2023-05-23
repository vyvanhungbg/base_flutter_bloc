import 'dart:io';

import 'package:base_flutter_bloc/base/base_error.dart';
import 'package:base_flutter_bloc/base/data_state.dart';
import 'package:base_flutter_bloc/core/extension/dio_extension.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/core/network/response/search_user_response_model.dart';
import 'package:base_flutter_bloc/layer/data/datasource/remote/user_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'UserRepository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.remote);

  final UserRemoteDataSource remote;

  @override
  Future<DataState<SearchUserResponseModel>> searchUserByName(
      ParamsSearchUser params) async {
    print("xxxx___________________12");
    try {
      final httpResponse = await remote.searchUserByName(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("xxxx___________________1");
        return DataSuccess(httpResponse.data);
      }
      print("xxxx___________________2");
      return DataFailure(httpResponse.remoteError);
    } on DioError catch (e) {
      // fetch from local cache
      print("xxxx___________________3");
      return DataFailure(RemoteError(
          error: e, message: e.message, code: e.response?.statusCode));
    } catch (e) {
      print("xxxx___________________${e}");
      return DataFailure(RemoteError(error: Exception(), message: "", code: 1));
    }
  }
}
