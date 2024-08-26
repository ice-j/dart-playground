part of '../log_lib.dart';

@singleton
class LogLibRegistry extends BaseRepositoryRegistry {
  @override
  FutureOr<List<CustomDatabaseRegistryPair<BaseRepository>>> setupFactory() {
    return [
      CustomDatabaseRegistryPair(AccountsRepository(name: 'log_lib.accounts'), 'accounts'),
      CustomDatabaseRegistryPair(SettingsRepository(name: 'log_lib.settings'), 'settings'),
    ];
  }
}