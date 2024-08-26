import 'package:get_it/get_it.dart';
import 'package:typetest/get_it/injectable_config.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  throwOnMissingDependencies: true,
)
void configureDependencies() => getIt.init();