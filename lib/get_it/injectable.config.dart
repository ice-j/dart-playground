// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_lib/get_it/injectable.module.dart' as _i590;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:log_lib/get_it/injectable.module.dart' as _i82;
import 'package:typetest/domain/repositories/accounts_repository.dart' as _i386;
import 'package:typetest/domain/repositories/settings_repository.dart' as _i522;
import 'package:typetest/domain/test_registry.dart' as _i95;
import 'package:typetest/get_it/repositories_module.dart' as _i77;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
    T Function<T>(T)? constructorCallback,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final ccb = constructorCallback ?? <T>(_) => _;
    final registerModule = _$RegisterModule();
    gh.singleton<_i95.TestRegistry>(() => ccb(_i95.TestRegistry()));
    gh.factory<String>(
      () => ccb(registerModule.accountsRepositoryName),
      instanceName: 'accountsRepositoryName',
    );
    gh.factory<String>(
      () => ccb(registerModule.settingsRepositoryName),
      instanceName: 'settingsRepositoryName',
    );
    gh.factory<_i522.SettingsRepository>(() => ccb(_i522.SettingsRepository(
        name: gh<String>(instanceName: 'settingsRepositoryName'))));
    gh.factory<_i386.AccountsRepository>(() => ccb(_i386.AccountsRepository(
        name: gh<String>(instanceName: 'accountsRepositoryName'))));
    await _i590.ApiLibPackageModule().init(gh);
    await _i82.LogLibPackageModule().init(gh);
    return this;
  }
}

class _$RegisterModule extends _i77.RegisterModule {}
