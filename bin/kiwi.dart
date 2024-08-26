import 'package:api_lib/api_lib.dart' as api_lib;
import 'package:kiwi/kiwi.dart';
import 'package:log_lib/log_lib.dart' as log_lib;
import 'package:typetest/domain/repositories/accounts_repository.dart';
import 'package:typetest/domain/repositories/settings_repository.dart';
import 'package:typetest/kiwi/test_kiwi_injector.dart';
import 'package:typetest/domain/test_registry.dart';

Future<void> main(List<String> arguments) async {
  // Initialize kiwi
  final kiwi = KiwiContainer();

  // Configure injectors
  getTestKiwiInjector().configure();
  api_lib.getApiLibKiwiInjector().configure();
  log_lib.getLogLibKiwiInjector().configure();

  // Register types

  // Resolve registry
  var testRegistry = kiwi<TestRegistry>();
  var apiRegistry = kiwi<api_lib.ApiLibRegistry>();
  var logRegistry = kiwi<log_lib.LogLibRegistry>();

  await testRegistry.registerWithKiwi();
  await apiRegistry.registerWithKiwi();
  await logRegistry.registerWithKiwi();

  // Resolve repositories from running package
  var kiwi_main_AccountsRepo = kiwi.resolve<AccountsRepository>();
  print(
      'Name: ${kiwi_main_AccountsRepo.name}, runtimeType: ${kiwi_main_AccountsRepo.runtimeType}');
  var kiwi_main_SettingsRepo = kiwi.resolve<SettingsRepository>();
  print(
      'Name: ${kiwi_main_SettingsRepo.name}, runtimeType: ${kiwi_main_SettingsRepo.runtimeType}');
  print('========= LOG LIB ==========');

  // Resolve repositories from log_lib
  var kiwi_LogLib_AccountsRepo = kiwi.resolve<log_lib.AccountsRepository>();
  print(
      'Name: ${kiwi_LogLib_AccountsRepo.name}, runtimeType: ${kiwi_LogLib_AccountsRepo.runtimeType}');
  var kiwi_LogLib_SettingsRepo = kiwi.resolve<log_lib.SettingsRepository>();
  print(
      'Name: ${kiwi_LogLib_SettingsRepo.name}, runtimeType: ${kiwi_LogLib_SettingsRepo.runtimeType}');

  print('========= API LIB ==========');
  // Resolve repositories from api_lib
  var kiwi_ApiLib_AccountsRepo = kiwi.resolve<log_lib.AccountsRepository>();
  print(
      'Name: ${kiwi_ApiLib_AccountsRepo.name}, runtimeType: ${kiwi_ApiLib_AccountsRepo.runtimeType}');
  var kiwi_ApiLib_SettingsRepo = kiwi.resolve<log_lib.SettingsRepository>();
  print(
      'Name: ${kiwi_ApiLib_SettingsRepo.name}, runtimeType: ${kiwi_ApiLib_SettingsRepo.runtimeType}');

  // Run internal methods to see what they resolve
  log_lib.someMethodRunWithKiwiContainer();
  api_lib.someMethodRunWithKiwiContainer();
}