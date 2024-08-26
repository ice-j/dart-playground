import 'package:injectable/injectable.dart';

@module
abstract class ApiLibModule {
  @Named('accountsRepositoryName')
  String get accountsRepositoryName => 'log_lib.accounts';
  @Named('settingsRepositoryName')
  String get settingsRepositoryName => 'log_lib.settings';
}