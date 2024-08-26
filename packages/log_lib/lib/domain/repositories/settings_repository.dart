part of '../../log_lib.dart';

@injectable
class SettingsRepository extends BaseRepository {
  SettingsRepository({@Named('log_lib.settingsRepositoryName') required super.name});
}