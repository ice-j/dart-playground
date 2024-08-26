import 'package:injectable/injectable.dart';

@module
abstract class ApiLibModule {
  @Named('log_lib.accountsRepositoryName')
  String get accountsRepositoryName => 'log_lib.accounts';
  @Named('log_lib.settingsRepositoryName')
  String get settingsRepositoryName => 'log_lib.settings';
}