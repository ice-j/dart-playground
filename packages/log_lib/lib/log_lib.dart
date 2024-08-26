import 'dart:async';
import 'package:db_lib/db_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kiwi/kiwi.dart';

export 'kiwi/log_lib_kiwi_injector.dart';

part 'domain/repositories/accounts_repository.dart';
part 'domain/log_lib_registry.dart';
part 'domain/repositories/settings_repository.dart';

void someMethodRunWithKiwiContainer() {
  print('log_lib:kiwi: someMethodRunWithKiwiContainer invoked');
  var kiwi = KiwiContainer();
  var accountRepo = kiwi<AccountsRepository>();
  var settingsRepo = kiwi<SettingsRepository>();

  print('log_lib:kiwi: Resolved AccountsRepository with name ${accountRepo.name}');
  print('log_lib:kiwi: Resolved SettingsRepository with name ${settingsRepo.name}');
}

void someMethodRunWithGetItAndInjectableContainer() {
  print('log_lib:get_it: someMethodRunWithKiwiContainer invoked');
  var getIt = GetIt.instance;
  var accountRepo = getIt<AccountsRepository>();
  var settingsRepo = getIt<SettingsRepository>();

  print('log_lib:get_it: Resolved AccountsRepository with name ${accountRepo.name}');
  print('log_lib:get_it: Resolved SettingsRepository with name ${settingsRepo.name}');
}

int calculate() {
  return 6 * 7;
}
