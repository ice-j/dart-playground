# Dart playground for experimenting with generics, type safety & DI options
- A test dart project to experiment with generics and DI.
- Multipackage solution to test DI scenaraios assuming there can be classes with the same names from a different package registered with the DI instance at the same time
- Contains implementation with GetIt + Injectable or Kiwi

# Workspace structure
- typetest
  - Main dart project that we assume it's going to have it's own Account and Settings repository
- packages/
  - db_lib
    - Mock of a database library providing abstract repository and registry
  - api_lib
    - Mock API library that we assume it's going to have it's own Account and Settings repository
  - log_lib
    - Mock logging library that we assume it's going to have it's own Account and Settings repository too

# How to run
- Prepare your dev env
  1. `dart pub global activate melos`
  2. `melos run dartgen`
  3. `dart pub get`
- Run the kiwi example:
  `dart run bin/kiwi.dart`
- Run the mi

# Dependencies
- get_it
- injectable
- kiwi

# DevDependencies
- injectable_generator
- kiwi_generator

# Dependency map
[!(./depdendency_map.puml)]