part of '../db_lib.dart';

abstract class BaseRepository {
  BaseRepository({required this.name});
  final String name;
}
