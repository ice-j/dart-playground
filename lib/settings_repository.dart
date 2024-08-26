import 'package:injectable/injectable.dart';
import 'package:typetest/abstract/base_repository.dart';

@named
@Injectable(as: BaseRepository)
class SettingsRepository extends BaseRepository {
  SettingsRepository({required super.name});
}
