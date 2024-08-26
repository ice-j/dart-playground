import 'dart:async';
import 'package:db_lib/db_lib.dart';
import 'package:injectable/injectable.dart';
import 'package:typetest/domain/repositories/accounts_repository.dart';
import 'package:typetest/domain/repositories/settings_repository.dart';

@singleton
class TestRegistry extends BaseRepositoryRegistry {
  @override
  FutureOr<List<CustomDatabaseRegistryPair<BaseRepository>>> setupFactory() {
    return [
      CustomDatabaseRegistryPair(AccountsRepository(name: 'main.accounts'), 'accounts'),
      CustomDatabaseRegistryPair(SettingsRepository(name: 'main.settings'), 'settings'),
    ];
  }
}
