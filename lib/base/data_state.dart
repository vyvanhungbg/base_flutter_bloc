import 'package:base_flutter_bloc/base/base_error.dart';

abstract class DataState<T> {
  const DataState({this.data, this.error});

  final T? data;
  final BaseError? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(final T? data) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(final BaseError error) : super(error: error);
}
