import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  late Dio dio;

  bool enableLogger;

  String baseUrl;

  ApiProvider(
      {required this.enableLogger,
      required this.baseUrl,
      BaseOptions? options}) {
    final dioTmp = Dio(options ?? BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(milliseconds: 20000)
      ..receiveTimeout = const Duration(milliseconds: 10000)
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      });

    if (enableLogger) {
      dioTmp.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    dio = dioTmp;
  }
}
