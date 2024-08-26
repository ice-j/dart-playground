import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:typetest/abstract/base_repository.dart';

/// An optional abstract interface to be implemented in each flutter app
/// or package. It will be used to automatically register the repositories with
/// the [CustomDatabaseServiceBase] and [GetIt].
/// An instance of the implementation have to be registered with GetIt
/// in order for the setup to work properly.
abstract class BaseRepositoryRegistry {
  BaseRepositoryRegistry();

  final List<CustomDatabaseRegistryPair> _repositoriesWithAdapters = [];

  /// Provide a factory method that returns a [List]<[CustomDatabaseRegistryPair]>
  /// with repositories and their corresponding adapters
  /// so they can be setup and registered with [GetIt]
  FutureOr<List<CustomDatabaseRegistryPair>> setupFactory();

  Future<void> register() async {
    final repositoryPairs = await setupFactory();
    print('_register invoked');
    if (repositoryPairs.isEmpty) {
      print('No repositories registered in $runtimeType');
      return;
    }

    _repositoriesWithAdapters.addAll(repositoryPairs);

    for (final repoPair in _repositoriesWithAdapters) {
      await _registerWithGetIt(repoPair.repository);
    }
  }

  Future<void> _registerWithGetIt<T extends BaseRepository>(
      T repository) async {
        print('Repository: ${repository.runtimeType} setup');
    GetIt.instance.registerFactory(() => repository);
    var r = await GetIt.instance.get(type: repository.runtimeType);
    print('Repository: ${repository.runtimeType} was registered'
        ' and initialized. Status: ${(r as BaseRepository).name} \n\t'
        ' Resolved from GetIt as: ${r.runtimeType}');
  }
}


/// Representing a KeyValue pair data structure holding
/// [repository] and [adapter] objects.
/// Used in [CustomRepositoryRegistry.setupFactory].
class CustomDatabaseRegistryPair<
    TRepo extends BaseRepository> extends CustomKeyValuePair<TRepo, String> {
  /// Creates an instance of [CustomDatabaseRegistryPair].
  const CustomDatabaseRegistryPair(super.key, super.value);

  /// Get the [TRepo] repository of this [CustomDatabaseRegistryPair] instance.
  TRepo get repository => key;

  /// Get the [TAdapter] adapter of this [CustomDatabaseRegistryPair] instance.
  String get adapter => value;
}


/// A generic KeyValue pair data structure that
/// one can use to store 2 objects of any type in a single paired object.
/// Example:
/// ```dart
///   final peopleWithAge = CustomKeyValuePair<String, int>('John Doe', 35);
///
///   // or
///
///   final user = User('John Doe');
///   final settings = Settings(locale: 'en-US');
///   final userAndSettings = CustomKeyValuePair<User, Settings>(user, settings);
/// ```
class CustomKeyValuePair<TKey, TValue> {
  /// Creates an instance of [CustomKeyValuePair].
  const CustomKeyValuePair(this.key, this.value);

  /// The [TKey] object.
  final TKey key;

  /// The [TValue] object.
  final TValue value;
}
