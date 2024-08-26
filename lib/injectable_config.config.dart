// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'accounts_repository.dart' as _i254;
import 'modules/repositories_module.dart' as _i885;
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
    final registerModule = _$RegisterModule();
    gh.singleton<_i8.TestRegistry>(() => _i8.TestRegistry());
    gh.factory<String>(
      () => registerModule.accountsRepositoryName,
      instanceName: 'accountsRepositoryName',
    );
    gh.factory<String>(
      () => registerModule.settingsRepositoryName,
      instanceName: 'settingsRepositoryName',
    );
    gh.factory<_i315.SettingsRepository>(() => _i315.SettingsRepository(
        name: gh<String>(instanceName: 'settingsRepositoryName')));
    gh.factory<_i254.AccountsRepository>(() => _i254.AccountsRepository(
        name: gh<String>(instanceName: 'accountsRepositoryName')));
    return this;
  }
}

class _$RegisterModule extends _i885.RegisterModule {}
