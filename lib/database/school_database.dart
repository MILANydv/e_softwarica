import 'dart:async';

import 'package:e_softwarica/dao/student_dao.dart';
import 'package:e_softwarica/dao/user_dao.dart';
import 'package:e_softwarica/entities/student_entity.dart';
import 'package:e_softwarica/entities/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'school_database.g.dart';

@Database(version: 1, entities: [Student, User])
abstract class SchoolDatabase extends FloorDatabase {
  StudentDAO get studentDAO;
  UserDAO get userDAO;
}
