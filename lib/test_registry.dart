import 'dart:async';

import 'package:typetest/abstract/base_repository.dart';
import 'package:typetest/abstract/base_repository_registry.dart';
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