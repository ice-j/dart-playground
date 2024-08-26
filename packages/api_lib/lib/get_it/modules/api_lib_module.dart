import 'package:injectable/injectable.dart';

@module
abstract class ApiLibModule {
  @Named('accountsRepositoryName')
  String get accountsRepositoryName => 'api_lib.accounts';
  @Named('settingsRepositoryName')
  String get settingsRepositoryName => 'api_lib.settings';
}