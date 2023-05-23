import 'package:base_flutter_bloc/base/base_error.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

extension DioExtension on HttpResponse {
  DioError get dioError => DioError(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
        type: DioErrorType.badResponse,
      );

  RemoteError get remoteError => RemoteError(
        code: response.statusCode,
        message: response.statusMessage,
        error: dioError,
      );
}
