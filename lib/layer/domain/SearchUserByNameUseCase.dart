import 'package:base_flutter_bloc/base/base_use_case.dart';
import 'package:base_flutter_bloc/base/data_state.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/layer/data/repository/UserRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/response/search_user_response_model.dart';

@injectable
class SearchUseByNameUseCase
    implements
        BaseUseCase<DataState<SearchUserResponseModel>, ParamsSearchUser> {
  SearchUseByNameUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<SearchUserResponseModel>> call(ParamsSearchUser params) =>
      _userRepository.searchUserByName(params);
}
