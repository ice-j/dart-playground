import 'package:injectable/injectable.dart';
import 'package:typetest/abstract/base_repository.dart';

@named
@Injectable(as: BaseRepository)
class AccountsRepository extends BaseRepository {
  AccountsRepository({required super.name});
}
