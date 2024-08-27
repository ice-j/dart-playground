# Overview
Dart playground for experimenting with generics, type safety & DI options containing:
- A test dart project to experiment with generics and DI.
- Multipackage solution to test DI scenaraios assuming there can be classes with the same names from a different package registered with the DI instance at the same time
- DI setup using GetIt + Injectable
- DI setup using Kiwi

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
  `dart run main.dart kiwi`
- Run the GetIt + Injectable:
  `dart run main.dart injectable`

# Dependencies
- get_it
- injectable
- kiwi

# DevDependencies
- injectable_generator
- kiwi_generator

# Dependency map
![Dependency Diagram](https://www.plantuml.com/plantuml/png/fL7HQiCm37pFLmZjUINTahGXU3yonf1jDJKpsCGkh1lzzv69UH3MFAnlbhZJtVci6oUAHuXatcZa19yLG78Vh71Rum0JPHVKmNa_L00KtQjt6fxJaI8hrE4T1p31XqdXNSlTmvxnPKPQlGAqXzRi7WNemxY2hAdPxKcG-HmvSyfNeCQsL8jwyNd_z6iadpqhd9EmNV7o3renTWDFf9V4jPyGeaIzIboqaavQwaRZJodpL7h7x-81F6ds2ijwPa6vrUccRtfP_YZBO7LvInOPBd-ARXPgcuMCxTjjPsLPmigvI_K5)