// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'abstract/base_repository.dart' as _i765;
import 'accounts_repository.dart' as _i254;
import 'settings_repository.dart' as _i315;
import 'test_registry.dart' as _i8;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i8.TestRegistry>(() => _i8.TestRegistry());
    gh.factory<_i765.BaseRepository>(
      () => _i254.AccountsRepository(name: gh<String>()),
      instanceName: 'AccountsRepository',
    );
    gh.factory<_i765.BaseRepository>(
      () => _i315.SettingsRepository(name: gh<String>()),
      instanceName: 'SettingsRepository',
    );
    return this;
  }
}
