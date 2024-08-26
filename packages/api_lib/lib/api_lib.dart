import 'dart:async';
import 'package:db_lib/db_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kiwi/kiwi.dart';

export 'kiwi/api_lib_kiwi_injector.dart';

part 'domain/repositories/accounts_repository.dart';
part 'domain/api_lib_registry.dart';
part 'domain/repositories/settings_repository.dart';

void someMethodRunWithKiwiContainer() {
  print('api_lib:kiwi: someMethodRunWithKiwiContainer invoked');
  var kiwi = KiwiContainer();
  var accountRepo = kiwi.resolve<AccountsRepository>();
  var settingsRepo = kiwi.resolve<SettingsRepository>();

  print('api_lib:kiwi: Resolved AccountsRepository with name ${accountRepo.name}');
  print('api_lib:kiwi: Resolved SettingsRepository with name ${settingsRepo.name}');
}

void someMethodRunWithGetItAndInjectableContainer() {
  print('api_lib:get_it: someMethodRunWithGetItAndInjectableContainer invoked');
  var getIt = GetIt.instance;
  print('api_lib:get_it: Scope name: ${getIt.currentScopeName}');
  var accountRepo = getIt<AccountsRepository>();
  var settingsRepo = getIt<SettingsRepository>();

  print('api_lib:get_it: Resolved AccountsRepository with name ${accountRepo.name}');
  print('api_lib:get_it: Resolved SettingsRepository with name ${settingsRepo.name}');
}