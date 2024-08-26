import 'package:get_it/get_it.dart';
import 'package:log_lib/get_it/injectable.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  throwOnMissingDependencies: true,
)
void configureDependencies() => getIt.init();