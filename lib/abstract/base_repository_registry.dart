import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:kiwi/kiwi.dart';
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

  Future<void> registerWithGetIt() async {
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
    print('_register finished \n\n');
  }

  Future<void> registerWithKiwi() async {
    final repositoryPairs = await setupFactory();
    print('\n\nkiwi: _register invoked');
    if (repositoryPairs.isEmpty) {
      print('kiwi: No repositories registered in $runtimeType');
      return;
    }

    _repositoriesWithAdapters.addAll(repositoryPairs);

    for (final repoPair in _repositoriesWithAdapters) {
      await _registerWithKiwi(repoPair.repository);
    }
    print('_register finished \n\n');
  }

  Future<void> _registerWithGetIt<T extends BaseRepository>(
      T repository) async {
    print('Repository: ${repository.runtimeType} setup');

    var r = GetIt.instance.get(type: repository.runtimeType);
    print('Instance of ${repository.runtimeType} was registered'
        ' and initialized. Type: ${(r).runtimeType} \n\t'
        ' Resolved from GetIt as: ${r.runtimeType}');
  }

  Future<void> _registerWithKiwi<T extends BaseRepository>(T repository) async {
    print('kiwi: Inferred type T is: ${T}');
    print('kiwi: Repository: ${repository.runtimeType} setup');
    // KiwiContainer().registerInstance(repository);
    // print('kiwi: Repository: ${repository.runtimeType} was registered'
    //     ' and initialized. name: ${(r as BaseRepository).name} \n\t'
    //     ' Resolved from Kiwi as: ${r.runtimeType}');
  }
}

/// Representing a KeyValue pair data structure holding
/// [repository] and [adapter] objects.
/// Used in [CustomRepositoryRegistry.setupFactory].
class CustomDatabaseRegistryPair<TRepo extends BaseRepository> {
  /// Creates an instance of [CustomDatabaseRegistryPair].
  CustomDatabaseRegistryPair(this.repository, this.adapter) {
    print('CustomDatabaseRegistryPair ctor \n'
        'Type inferred: $TRepo \n'
        'RuntimeType: ${repository.runtimeType}');
  }

  /// Get the [TRepo] repository of this [CustomDatabaseRegistryPair] instance.
  final TRepo repository;

  /// Get the [TAdapter] adapter of this [CustomDatabaseRegistryPair] instance.
  final String adapter;
}
