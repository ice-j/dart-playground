import 'package:api_lib/api_lib.dart' as api_lib;
import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
import 'package:log_lib/log_lib.dart' as log_lib;
import 'package:typetest/accounts_repository.dart';
import 'package:typetest/settings_repository.dart';
import 'package:typetest/test_kiwi_injector.dart';
import 'package:typetest/test_registry.dart';
import 'package:typetest/typetest.dart' as typetest;

Future<void> main(List<String> arguments) async {
  if(arguments.isNotEmpty && arguments[0].toLowerCase() == "getit") {
    await main_get_it();
  } else {
    await main_kiwi();
  }
}


Future<void> main_kiwi() async {
  // Configure injectors
  getTestKiwiInjector().configure();
  api_lib.getApiLibKiwiInjector().configure();
  log_lib.getLogLibKiwiInjector().configure();

  // Initialize kiwi
  final kiwi = KiwiContainer();

  // Register types

  // Resolve registry
  var testRegistry = kiwi<TestRegistry>();
  var apiRegistry = kiwi<api_lib.ApiLibRegistry>();
  var logRegistry = kiwi<log_lib.LogLibRegistry>();

  await testRegistry.registerWithKiwi();
  await apiRegistry.registerWithKiwi();
  await logRegistry.registerWithKiwi();
  
  // Resolve repositories from running package
  var getit_main_AccountsRepo = kiwi.resolve<AccountsRepository>();
  print('Name: ${getit_main_AccountsRepo.name}, runtimeType: ${getit_main_AccountsRepo.runtimeType}');
  var getit_main_SettingsRepo = kiwi.resolve<SettingsRepository>();
  print('Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_main_SettingsRepo.runtimeType}');
  print('========= LOG LIB ==========');
  
  // Resolve repositories from log_lib
  var getit_LogLib_AccountsRepo = kiwi.resolve<log_lib.AccountsRepository>();
  print('Name: ${getit_main_AccountsRepo.name}, runtimeType: ${getit_LogLib_AccountsRepo.runtimeType}');
  var getit_LogLib_SettingsRepo = kiwi.resolve<log_lib.SettingsRepository>();
  print('Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_LogLib_SettingsRepo.runtimeType}');

  print('========= API LIB ==========');
  // Resolve repositories from api_lib
  var getit_ApiLib_AccountsRepo = kiwi.resolve<log_lib.AccountsRepository>();
  print('Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_ApiLib_AccountsRepo.runtimeType}');
  var getit_ApiLib_SettingsRepo = kiwi.resolve<log_lib.SettingsRepository>();
  print('Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_ApiLib_SettingsRepo.runtimeType}');
}

Future<void> main_get_it() async {
  // Initialize GetIt
  final getIt = GetIt.instance;

  // Register types
  getIt.registerSingleton(TestRegistry());
  getIt.registerSingleton(api_lib.ApiLibRegistry());
  getIt.registerSingleton(log_lib.LogLibRegistry());


  // Resolve registry
  var registryGetIt = getIt.get<TestRegistry>();

  await registryGetIt.registerWithGetIt();

  // Resolve repositories from running package
  var getit_main_AccountsRepo = getIt.get<AccountsRepository>();
  var getit_main_SettingsRepo = getIt.get<SettingsRepository>();

  // Resolve repositories from log_lib
  var getit_LogLib_AccountsRepo = getIt.get<log_lib.AccountsRepository>();
  var getit_LogLib_SettingsRepo = getIt.get<log_lib.SettingsRepository>();

  // Resolve repositories from api_lib
  var getit_ApiLib_AccountsRepo = getIt.get<log_lib.AccountsRepository>();
  var getit_ApiLib_SettingsRepo = getIt.get<log_lib.SettingsRepository>();

  // Run internal methods to see what they resolve
  log_lib.someMethodRunWithKiwiContainer();
  api_lib.someMethodRunWithKiwiContainer();
}

