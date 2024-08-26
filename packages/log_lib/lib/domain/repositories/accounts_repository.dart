part of '../../log_lib.dart';

@injectable
class AccountsRepository extends BaseRepository {
  AccountsRepository({@Named('log_lib.accountsRepositoryName')required super.name});
}