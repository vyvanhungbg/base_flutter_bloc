import 'package:base_flutter_bloc/config.dart' as AppConfig;
import 'package:base_flutter_bloc/core/network/api_client.dart';
import 'package:base_flutter_bloc/layer/data/datasource/remote/user_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart' as config;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $initGetIt(getIt);

Future<void> $initGetIt(
  GetIt getIt, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  final gh = GetItHelper(getIt, environment.toString());

  gh.factory<ApiClient>(() => ApiClient(enableLogging: true));

  gh.factory<Dio>(() => getIt<ApiClient>().apiProvider.dio);

  gh.factory<UserRemoteDataSource>(() => UserRemoteDataSource(getIt<Dio>()));

  config.$initGetIt(getIt);
}
