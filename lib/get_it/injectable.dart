import 'package:api_lib/get_it/injectable.module.dart';
import 'package:get_it/get_it.dart';
import 'package:log_lib/get_it/injectable.module.dart';
import 'package:typetest/get_it/injectable.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  throwOnMissingDependencies: true,
  usesConstructorCallback: true,
  externalPackageModulesAfter: [
    ExternalModule(ApiLibPackageModule),
    ExternalModule(LogLibPackageModule),
  ]
)
void configureInjectableDependencies() => getIt.init();