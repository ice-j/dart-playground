import 'package:get_it/get_it.dart';
import 'package:typetest/accounts_repository.dart';
import 'package:typetest/settings_repository.dart';
import 'package:typetest/test_registry.dart';
import 'package:typetest/typetest.dart' as typetest;

Future<void> main(List<String> arguments) async {
  // Initialize GetIt
  final getIt = GetIt.instance;
  getIt.registerSingleton(TestRegistry());
  var registry = getIt.get<TestRegistry>();
  await registry.register();

  var accountsRepo = getIt.get<AccountsRepository>();
  var settingsRepo = getIt.get<SettingsRepository>();
  
}



