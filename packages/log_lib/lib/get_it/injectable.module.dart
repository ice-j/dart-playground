//@GeneratedMicroModule;LogLibPackageModule;package:log_lib/get_it/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:log_lib/get_it/modules/log_lib_module.dart' as _i304;
import 'package:log_lib/log_lib.dart' as _i615;

class LogLibPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final apiLibModule = _$ApiLibModule();
    gh.singleton<_i615.LogLibRegistry>(() => _i615.LogLibRegistry());
    gh.factory<String>(
      () => apiLibModule.settingsRepositoryName,
      instanceName: 'log_lib.settingsRepositoryName',
    );
    gh.factory<String>(
      () => apiLibModule.accountsRepositoryName,
      instanceName: 'log_lib.accountsRepositoryName',
    );
    gh.factory<_i615.SettingsRepository>(() => _i615.SettingsRepository(
        name: gh<String>(instanceName: 'log_lib.settingsRepositoryName')));
    gh.factory<_i615.AccountsRepository>(() => _i615.AccountsRepository(
        name: gh<String>(instanceName: 'log_lib.accountsRepositoryName')));
  }
}

class _$ApiLibModule extends _i304.ApiLibModule {}
