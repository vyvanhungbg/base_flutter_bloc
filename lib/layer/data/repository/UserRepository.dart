import 'package:base_flutter_bloc/base/data_state.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/core/network/response/search_user_response_model.dart';

mixin UserRepository {
  Future<DataState<SearchUserResponseModel>> searchUserByName(
      ParamsSearchUser params);
}
