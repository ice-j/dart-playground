import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
import 'package:typetest/accounts_repository.dart';
import 'package:typetest/injectable_config.dart';
import 'package:typetest/settings_repository.dart';
import 'package:typetest/test_kiwi_injector.dart';
import 'package:typetest/test_registry.dart';
import 'package:typetest/typetest.dart' as typetest;

Future<void> main(List<String> arguments) async {
  if (arguments.isNotEmpty && arguments[0].toLowerCase() == "getit") {
    await main_get_it();
  } else {
    await main_kiwi();
  }
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

  // Configure injectable
  configureDependencies();
  await getIt.allReady();

  // Resolve registry
  var registryGetIt = getIt.get<TestRegistry>();

  await registryGetIt.registerWithGetIt();

  final isAccRepoRegistered = getIt.isRegistered<AccountsRepository>();
  final isSettRepoRegistered = getIt.isRegistered<SettingsRepository>();
  print("AccountsRepository isRegistered: $isAccRepoRegistered");
  print("SettingsRepository isRegistered: $isSettRepoRegistered");
  // Resolve repositories
  var getitAccountsRepo = getIt.get<AccountsRepository>();
  print('get_it: AccountsRepository runtimeType: ${getitAccountsRepo.runtimeType}, name: ${getitAccountsRepo.name}');
  var getitSettingsRepo = getIt.get<SettingsRepository>();
  print('get_it: SettingsRepository runtimeType: ${getitSettingsRepo.runtimeType}, name: ${getitSettingsRepo.name}');

}
