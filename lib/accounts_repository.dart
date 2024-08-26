import 'package:injectable/injectable.dart';
import 'package:typetest/abstract/base_repository.dart';

@injectable
class AccountsRepository extends BaseRepository {
  AccountsRepository({@Named('accountsRepositoryName') required super.name});
}
