part of '../../api_lib.dart';

@injectable
class AccountsRepository extends BaseRepository {
  AccountsRepository({@Named('api_lib.accountsRepositoryName') required super.name});
}