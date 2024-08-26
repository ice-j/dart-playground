import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('accountsRepositoryName')
  String get accountsRepositoryName => 'get_it.accounts';
  @Named('settingsRepositoryName')
  String get settingsRepositoryName => 'get_it.settings';
}