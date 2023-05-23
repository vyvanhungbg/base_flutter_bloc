import 'package:base_flutter_bloc/core/network/api_endpoint.dart';
import 'package:base_flutter_bloc/core/network/api_provider.dart';

class ApiClient {
  final bool enableLogging;
  late final ApiProvider apiProvider;

  ApiClient({required this.enableLogging}) {
    apiProvider = ApiProvider(enableLogger: true, baseUrl: ApiEndpoint.baseUrl);
  }
}
