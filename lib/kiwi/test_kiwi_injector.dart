import 'package:kiwi/kiwi.dart';
import 'package:typetest/domain/repositories/accounts_repository.dart';
import 'package:typetest/domain/repositories/settings_repository.dart';
import 'package:typetest/domain/test_registry.dart';

part 'test_kiwi_injector.g.dart';

abstract class TestKiwiInjector {
  void configure() {
    _configureInstances();
    _configureFactories();
  }

  void _configureInstances() {
    final container = KiwiContainer();
    container.registerInstance(AccountsRepository(name: 'accounts'));
    container.registerInstance(SettingsRepository(name: 'settings'));
  }

  @Register.singleton(TestRegistry)
  void _configureFactories();
}

TestKiwiInjector getTestKiwiInjector() => _$TestKiwiInjector();