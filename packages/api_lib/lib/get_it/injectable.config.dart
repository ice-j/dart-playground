// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api_lib.dart' as _i1019;
import 'modules/api_lib_module.dart' as _i599;

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
    gh.singleton<_i1019.ApiLibRegistry>(() => _i1019.ApiLibRegistry());
    gh.factory<String>(
      () => apiLibModule.accountsRepositoryName,
      instanceName: 'accountsRepositoryName',
    );
    gh.factory<String>(
      () => apiLibModule.settingsRepositoryName,
      instanceName: 'settingsRepositoryName',
    );
    return this;
  }
}

class _$ApiLibModule extends _i599.ApiLibModule {}
