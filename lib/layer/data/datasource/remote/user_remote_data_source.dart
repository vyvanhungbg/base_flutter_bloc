import 'package:base_flutter_bloc/core/network/api_endpoint.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/core/network/response/search_user_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(final Dio dio) = _UserRemoteDataSource;

  @GET(ApiEndpoint.searchUser)
  Future<HttpResponse<SearchUserResponseModel?>> searchUserByName(
      @Queries() final ParamsSearchUser params);
}
