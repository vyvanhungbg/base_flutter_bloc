import 'package:equatable/equatable.dart';

abstract class BaseError extends Equatable {
  const BaseError({required this.error, this.message});

  final Exception error;
  final String? message;

  @override
  List<Object?> get props => [error, message];

  @override
  String toString() => 'BaseError{message: $message | error: $error }';
}

class LocalError extends BaseError {
  const LocalError(
      {required final Exception error, required final String message})
      : super(error: error, message: message);

  @override
  String toString() => 'LocalError{message $message | error${error.toString()}';
}

class RemoteError extends BaseError {
  final int? code;

  const RemoteError(
      {required final Exception error,
      required final String? message,
      this.code = -1})
      : super(error: error, message: message);

  String getNameError() {
    switch (code) {
      case 400:
        return 'BAD_REQUEST [${error.toString()}]';
      case 401:
        return 'UNAUTHORIZED  [${error.toString()}]';
      case 403:
        return 'FORBIDDEN  [${error.toString()}]';
      case 404:
        return 'NOT_FOUND   [${error.toString()}]';
      case 405:
        return 'METHOD_NOT_ALLOWED   [${error.toString()}]';
      case 413:
        return 'REQUEST_ENTITY_TOO_LARGE  [${error.toString()}]';
      case 417:
        return 'EXPECTATION_FAILED  [${error.toString()}]';
      case 429:
        return 'TOO_MANY_REQUESTS  [${error.toString()}]';
      case 500:
        return 'INTERNAL_SERVER_ERROR  [${error.toString()}]';
      case 501:
        return 'NOT_IMPLEMENTED  [${error.toString()}]';
      case 503:
        return 'SERVICE_UNAVAILABLE  [${error.toString()}]';
      default:
        return error.toString();
    }
  }

  @override
  String toString() => 'RemoteError{code: $code | ${getNameError()}';
}
