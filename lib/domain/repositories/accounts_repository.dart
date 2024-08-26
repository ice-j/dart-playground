import 'package:db_lib/db_lib.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountsRepository extends BaseRepository {
  AccountsRepository({@Named('accountsRepositoryName') required super.name});
}
