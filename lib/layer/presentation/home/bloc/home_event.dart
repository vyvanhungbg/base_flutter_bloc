part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {
  final ParamsSearchUser params;

  HomeStarted(this.params);
}

class HomeSearchSubmitted extends HomeEvent {
  final ParamsSearchUser params;

  HomeSearchSubmitted(this.params);
}
