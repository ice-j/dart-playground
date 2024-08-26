import 'package:injectable/injectable.dart';

@module
abstract class ApiLibModule {
  // The next line breaks injectable because of a duplicate named factory parameter :|
  // @Named('accountsRepositoryName')
  @Named('api_lib.accountsRepositoryName')
  String get accountsRepositoryName => 'api_lib.accounts';
  @Named('api_lib.settingsRepositoryName')
  String get settingsRepositoryName => 'api_lib.settings';
}