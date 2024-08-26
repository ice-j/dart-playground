import 'package:api_lib/api_lib.dart' as api_lib;
import 'package:get_it/get_it.dart';
import 'package:log_lib/log_lib.dart' as log_lib;
import 'package:typetest/domain/repositories/accounts_repository.dart';
import 'package:typetest/get_it/injectable.dart';
import 'package:typetest/domain/repositories/settings_repository.dart';
import 'package:typetest/domain/test_registry.dart';

Future<void> main(List<String> arguments) async {
  // Initialize GetIt
  final getIt = GetIt.instance;

  // Configure injectable
  configureInjectableDependencies();

  // Await for all getIt depdendencies to be ready
  await getIt.allReady();

  // Resolve registry
  final testRegistry = getIt<TestRegistry>();

  final apiRegistry = getIt<api_lib.ApiLibRegistry>();
  final logRegistry = getIt<log_lib.LogLibRegistry>();

  await testRegistry.registerWithGetIt();
  await apiRegistry.registerWithGetIt();
  await logRegistry.registerWithGetIt();

  // Resolve repositories from running package
  final getit_main_AccountsRepo = getIt<AccountsRepository>();
  print(
      'Name: ${getit_main_AccountsRepo.name}, runtimeType: ${getit_main_AccountsRepo.runtimeType}');
  final getit_main_SettingsRepo = getIt<SettingsRepository>();
  print(
      'Name: ${getit_main_SettingsRepo.name}, runtimeType: ${getit_main_SettingsRepo.runtimeType}');

  print('========= API LIB ==========');
  // Resolve repositories from api_lib
  final getit_ApiLib_AccountsRepo = getIt<log_lib.AccountsRepository>();
  print(
      'Name: ${getit_ApiLib_AccountsRepo.name}, runtimeType: ${getit_ApiLib_AccountsRepo.runtimeType}');
  final getit_ApiLib_SettingsRepo = getIt<log_lib.SettingsRepository>();
  print(
      'Name: ${getit_ApiLib_SettingsRepo.name}, runtimeType: ${getit_ApiLib_SettingsRepo.runtimeType}');

  // Run internal method to see what it resolves
  api_lib.someMethodRunWithGetItAndInjectableContainer();

  print('========= LOG LIB ==========');

  // Resolve repositories from log_lib
  final getit_LogLib_AccountsRepo = getIt<log_lib.AccountsRepository>();
  print(
      'Name: ${getit_LogLib_AccountsRepo.name}, runtimeType: ${getit_LogLib_AccountsRepo.runtimeType}');
  final getit_LogLib_SettingsRepo = getIt<log_lib.SettingsRepository>();
  print(
      'Name: ${getit_LogLib_SettingsRepo.name}, runtimeType: ${getit_LogLib_SettingsRepo.runtimeType}');

  // Run internal method to see what it resolves
  log_lib.someMethodRunWithGetItAndInjectableContainer();
}
