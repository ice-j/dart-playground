import 'dart:async';
import 'package:db_lib/db_lib.dart';
import 'package:kiwi/kiwi.dart';

export 'api_lib_kiwi_injector.dart';

part 'accounts_repository.dart';
part 'api_lib_registry.dart';
part 'settings_repository.dart';

void someMethodRunWithKiwiContainer() {
  print('api_lib:kiwi: someMethodRunWithKiwiContainer invoked');
  var kiwi = KiwiContainer();
  var accountRepo = kiwi.resolve<AccountsRepository>();
  var settingsRepo = kiwi.resolve<SettingsRepository>();

  print('api_lib:kiwi: Resolved AccountsRepository with name ${accountRepo.name}');
  print('api_lib:kiwi: Resolved SettingsRepository with name ${settingsRepo.name}');
}