import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
import 'package:typetest/accounts_repository.dart';
import 'package:typetest/injectable_config.dart';
import 'package:typetest/settings_repository.dart';
import 'package:typetest/test_kiwi_injector.dart';
import 'package:typetest/test_registry.dart';
import 'package:typetest/typetest.dart' as typetest;

Future<void> main(List<String> arguments) async {
  configureDependencies();
  await main_get_it();
}

Future<void> main_kiwi() async {
  // Configure injectors
  TestKiwiInjector testInjector = getTestKiwiInjector();
  testInjector.configure();

  // Initialize kiwi
  final kiwi = KiwiContainer();

  // Register types

  // Resolve registry
  var registryKiwi = kiwi<TestRegistry>();

  await registryKiwi.registerWithKiwi();

  // Resolve repositories
  var kiwiAccountsRepo = kiwi.resolve<AccountsRepository>();
  print(
      'Name: ${kiwiAccountsRepo.name}, runtimeType: ${kiwiAccountsRepo.runtimeType}');
  var kiwiSettingsRepo = kiwi.resolve<SettingsRepository>();
  print(
      'Name: ${kiwiSettingsRepo.name}, runtimeType: ${kiwiSettingsRepo.runtimeType}');
}

Future<void> main_get_it() async {
  // Initialize GetIt
  final getIt = GetIt.instance;

  // Resolve registry
  var registryGetIt = getIt.get<TestRegistry>();

  await registryGetIt.registerWithGetIt();

  // Resolve repositories
  var getitAccountsRepo = getIt.get<AccountsRepository>();
  var getitSettingsRepo = getIt.get<SettingsRepository>();
}
