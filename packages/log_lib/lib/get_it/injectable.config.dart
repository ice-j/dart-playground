// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../log_lib.dart' as _i313;
import 'modules/log_lib_module.dart' as _i176;

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
    final apiLibModule = _$ApiLibModule();
    gh.singleton<_i313.LogLibRegistry>(() => _i313.LogLibRegistry());
    gh.factory<String>(
      () => apiLibModule.accountsRepositoryName,
      instanceName: 'accountsRepositoryName',
    );
    gh.factory<String>(
      () => apiLibModule.settingsRepositoryName,
      instanceName: 'settingsRepositoryName',
    );
    gh.factory<_i313.AccountsRepository>(
        () => _i313.AccountsRepository(name: gh<String>()));
    gh.factory<_i313.SettingsRepository>(
        () => _i313.SettingsRepository(name: gh<String>()));
    return this;
  }
}

class _$ApiLibModule extends _i176.ApiLibModule {}
