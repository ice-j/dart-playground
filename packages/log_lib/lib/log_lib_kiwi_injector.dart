import 'package:kiwi/kiwi.dart';
import 'package:log_lib/log_lib.dart';

part 'log_lib_kiwi_injector.g.dart';

abstract class LogLibKiwiInjector {
  void configure() {
    _configureInstances();
    _configureFactories();
  }

  void _configureInstances() {
    final container = KiwiContainer();
    container.registerInstance(AccountsRepository(name: 'log_lib.accounts'));
    container.registerInstance(SettingsRepository(name: 'log_lib.settings'));
  }

  @Register.singleton(LogLibRegistry)
  void _configureFactories();
}

LogLibKiwiInjector getLogLibKiwiInjector() => _$LogLibKiwiInjector();