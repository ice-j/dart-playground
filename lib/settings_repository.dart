import 'package:injectable/injectable.dart';
import 'package:typetest/abstract/base_repository.dart';

@injectable
class SettingsRepository extends BaseRepository {
  SettingsRepository({@Named('settingsRepositoryName') required super.name});
}
