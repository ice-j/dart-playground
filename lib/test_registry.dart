import 'dart:async';

import 'package:db_lib/db_lib.dart';
import 'package:typetest/accounts_repository.dart';
import 'package:typetest/settings_repository.dart';

class TestRegistry extends BaseRepositoryRegistry {
  @override
  FutureOr<List<CustomDatabaseRegistryPair<BaseRepository>>> setupFactory() {
    return [
      CustomDatabaseRegistryPair(AccountsRepository(name: 'accounts'), 'accounts'),
      CustomDatabaseRegistryPair(SettingsRepository(name: 'settings'), 'settings'),
    ];
  }
}