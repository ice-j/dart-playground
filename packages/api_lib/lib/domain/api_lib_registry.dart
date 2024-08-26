part of '../api_lib.dart';

@Singleton()
class ApiLibRegistry extends BaseRepositoryRegistry {
  @override
  FutureOr<List<CustomDatabaseRegistryPair<BaseRepository>>> setupFactory() {
    return [
      CustomDatabaseRegistryPair(AccountsRepository(name: 'api_lib.accounts'), 'api_lib.accounts'),
      CustomDatabaseRegistryPair(SettingsRepository(name: 'api_lib.settings'), 'api_lib.settings'),
    ];
  }
}