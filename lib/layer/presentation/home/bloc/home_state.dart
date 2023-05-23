part of 'home_bloc.dart';

enum HomeStatus { initial, loadInProgress, loadComplete, refreshing }

class HomeState extends Equatable {
  final HomeStatus status;
  final BaseError? error;
  final List<UserResponseModel>? users;

  const HomeState({this.error, this.status = HomeStatus.initial, this.users});

  HomeState copyWith({
    HomeStatus? status,
    BaseError? error,
    List<UserResponseModel>? users,
  }) =>
      HomeState(
          error: error ?? this.error,
          status: status ?? this.status,
          users: users ?? this.users);

  @override
  List<Object?> get props => [status, error, users];
}
