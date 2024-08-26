import 'package:db_lib/db_lib.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsRepository extends BaseRepository {
  SettingsRepository({@Named('settingsRepositoryName') required super.name});
}
