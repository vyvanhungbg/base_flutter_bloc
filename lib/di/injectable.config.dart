// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../layer/data/datasource/remote/user_remote_data_source.dart' as _i5;
import '../layer/data/repository/UserRepository.dart' as _i3;
import '../layer/data/repository/UserRepositoryImpl.dart' as _i4;
import '../layer/domain/SearchUserByNameUseCase.dart' as _i6;
import '../layer/presentation/home/bloc/home_bloc.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.UserRepository>(
      () => _i4.UserRepositoryImpl(gh<_i5.UserRemoteDataSource>()));
  gh.factory<_i6.SearchUseByNameUseCase>(
      () => _i6.SearchUseByNameUseCase(gh<_i3.UserRepository>()));
  gh.factory<_i7.HomeBloc>(
      () => _i7.HomeBloc(gh<_i6.SearchUseByNameUseCase>()));
  return getIt;
}
