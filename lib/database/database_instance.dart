
import 'package:e_softwarica/database/school_database.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;
  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<SchoolDatabase> getDatabaseInstance() async {
    return $FloorSchoolDatabase.databaseBuilder('school_database.db').build();
  }
}
