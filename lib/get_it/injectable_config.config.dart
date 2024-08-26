// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../domain/repositories/accounts_repository.dart' as _i939;
import '../domain/repositories/settings_repository.dart' as _i977;
import '../domain/test_registry.dart' as _i113;
import 'repositories_module.dart' as _i112;

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
    gh.singleton<_i113.TestRegistry>(() => _i113.TestRegistry());
    gh.factory<String>(
      () => registerModule.accountsRepositoryName,
      instanceName: 'accountsRepositoryName',
    );
    gh.factory<String>(
      () => registerModule.settingsRepositoryName,
      instanceName: 'settingsRepositoryName',
    );
    gh.factory<_i977.SettingsRepository>(() => _i977.SettingsRepository(
        name: gh<String>(instanceName: 'settingsRepositoryName')));
    gh.factory<_i939.AccountsRepository>(() => _i939.AccountsRepository(
        name: gh<String>(instanceName: 'accountsRepositoryName')));
    return this;
  }
}

class _$RegisterModule extends _i112.RegisterModule {}
