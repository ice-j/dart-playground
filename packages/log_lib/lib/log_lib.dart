import 'dart:async';
import 'package:db_lib/db_lib.dart';
import 'package:kiwi/kiwi.dart';

export 'log_lib_kiwi_injector.dart';

part 'accounts_repository.dart';
part 'log_lib_registry.dart';
part 'settings_repository.dart';

void someMethodRunWithKiwiContainer() {
  print('log_lib:kiwi: someMethodRunWithKiwiContainer invoked');
  var kiwi = KiwiContainer();
  var accountRepo = kiwi.resolve<AccountsRepository>();
  var settingsRepo = kiwi.resolve<SettingsRepository>();

  print('log_lib:kiwi: Resolved AccountsRepository with name ${accountRepo.name}');
  print('log_lib:kiwi: Resolved SettingsRepository with name ${settingsRepo.name}');
}

int calculate() {
  return 6 * 7;
}
