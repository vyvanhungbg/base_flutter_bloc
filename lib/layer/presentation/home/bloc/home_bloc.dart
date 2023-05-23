import 'dart:async';

import 'package:base_flutter_bloc/base/base_error.dart';
import 'package:base_flutter_bloc/base/data_state.dart';
import 'package:base_flutter_bloc/core/network/params/params_search_user.dart';
import 'package:base_flutter_bloc/core/network/response/user_response_model.dart';
import 'package:base_flutter_bloc/layer/domain/SearchUserByNameUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._searchUseByNameUseCase) : super(const HomeState()) {
    on<HomeStarted>(started);
    on<HomeSearchSubmitted>(submitted);

  }

  final SearchUseByNameUseCase _searchUseByNameUseCase;

  Future<void> started(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loadInProgress));

    final result = await _searchUseByNameUseCase.call(event.params);

    if (result is DataSuccess) {
      emit(state.copyWith(
          status: HomeStatus.loadComplete, users: result.data?.items));
    } else {
      emit(
          state.copyWith(status: HomeStatus.loadComplete, error: result.error));
    }
  }

  Future<void> submitted(
    HomeSearchSubmitted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loadInProgress));

    final result = await _searchUseByNameUseCase.call(event.params);

    if (result is DataSuccess) {
      emit(state.copyWith(
          status: HomeStatus.loadComplete, users: result.data?.items));
    } else {
      emit(
          state.copyWith(status: HomeStatus.loadComplete, error: result.error));
    }
  }
}
