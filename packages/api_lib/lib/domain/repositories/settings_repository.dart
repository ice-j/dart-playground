part of '../../api_lib.dart';

@injectable
class SettingsRepository extends BaseRepository {
  SettingsRepository({@Named('api_lib.settingsRepositoryName')required super.name});
}