//@GeneratedMicroModule;ApiLibPackageModule;package:api_lib/get_it/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:api_lib/api_lib.dart' as _i712;
import 'package:api_lib/get_it/modules/api_lib_module.dart' as _i1018;
import 'package:injectable/injectable.dart' as _i526;

class ApiLibPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final apiLibModule = _$ApiLibModule();
    gh.singleton<_i712.ApiLibRegistry>(() => _i712.ApiLibRegistry());
    gh.factory<String>(
      () => apiLibModule.accountsRepositoryName,
      instanceName: 'api_lib.accountsRepositoryName',
    );
    gh.factory<_i712.AccountsRepository>(() => _i712.AccountsRepository(
        name: gh<String>(instanceName: 'api_lib.accountsRepositoryName')));
    gh.factory<String>(
      () => apiLibModule.settingsRepositoryName,
      instanceName: 'api_lib.settingsRepositoryName',
    );
    gh.factory<_i712.SettingsRepository>(() => _i712.SettingsRepository(
        name: gh<String>(instanceName: 'api_lib.settingsRepositoryName')));
  }
}

class _$ApiLibModule extends _i1018.ApiLibModule {}
