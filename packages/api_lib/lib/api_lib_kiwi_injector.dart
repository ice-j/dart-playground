import 'package:api_lib/api_lib.dart';
import 'package:kiwi/kiwi.dart';

part 'api_lib_kiwi_injector.g.dart';

abstract class ApiLibKiwiInjector {
  void configure() {
    _configureInstances();
    _configureFactories();
  }

  void _configureInstances() {
    final container = KiwiContainer();
    container.registerInstance(AccountsRepository(name: 'api_lib.accounts'));
    container.registerInstance(SettingsRepository(name: 'api_lib.settings'));
  }

  @Register.singleton(ApiLibRegistry)
  void _configureFactories();
}

ApiLibKiwiInjector getApiLibKiwiInjector() => _$ApiLibKiwiInjector();