import 'package:api_lib/api_lib.dart' as api_lib;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:log_lib/log_lib.dart' as log_lib;
import 'package:typetest/domain/repositories/accounts_repository.dart';
import 'package:typetest/get_it/injectable_config.dart';
import 'package:typetest/domain/repositories/settings_repository.dart';
import 'package:typetest/domain/test_registry.dart';

Future<void> main(List<String> arguments) async {
  // Initialize GetIt
  final getIt = GetIt.instance;

  // Configure injectable
  configureDependencies();

  // Resolve registry
  var testRegistry = getIt<TestRegistry>();
  var apiRegistry = getIt<api_lib.ApiLibRegistry>();
  var logRegistry = getIt<log_lib.LogLibRegistry>();

  await testRegistry.registerWithKiwi();
  await apiRegistry.registerWithKiwi();
  await logRegistry.registerWithKiwi();

  // Resolve repositories from running package
  var getit_main_AccountsRepo = getIt<AccountsRepository>();
  print(
      'Name: ${getit_main_AccountsRepo.name}, runtimeType: ${getit_main_AccountsRepo.runtimeType}');
  var getit_main_SettingsRepo = getIt<SettingsRepository>();
  print(
      'Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_main_SettingsRepo.runtimeType}');
  print('========= LOG LIB ==========');

  // Resolve repositories from log_lib
  var getit_LogLib_AccountsRepo = getIt<log_lib.AccountsRepository>();
  print(
      'Name: ${getit_LogLib_AccountsRepo.name}, runtimeType: ${getit_LogLib_AccountsRepo.runtimeType}');
  var getit_LogLib_SettingsRepo = getIt<log_lib.SettingsRepository>();
  print(
      'Name: ${getit_LogLib_SettingsRepo.name}, runtimeType: ${getit_LogLib_SettingsRepo.runtimeType}');

  print('========= API LIB ==========');
  // Resolve repositories from api_lib
  var getit_ApiLib_AccountsRepo = getIt<log_lib.AccountsRepository>();
  print(
      'Name: ${getit_ApiLib_AccountsRepo.name}, runtimeType: ${getit_ApiLib_AccountsRepo.runtimeType}');
  var getit_ApiLib_SettingsRepo = getIt<log_lib.SettingsRepository>();
  print(
      'Name: ${getit_ApiLib_SettingsRepo.name}, runtimeType: ${getit_ApiLib_SettingsRepo.runtimeType}');

  // Run internal methods to see what they resolve
  log_lib.someMethodRunWithKiwiContainer();
  api_lib.someMethodRunWithKiwiContainer();
}
