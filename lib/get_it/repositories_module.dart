import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named('accountsRepositoryName')
  String get accountsRepositoryName => 'main.accounts';
  @Named('settingsRepositoryName')
  String get settingsRepositoryName => 'main.settings';
}