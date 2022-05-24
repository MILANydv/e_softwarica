// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSchoolDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolDatabaseBuilder databaseBuilder(String name) =>
      _$SchoolDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SchoolDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SchoolDatabaseBuilder(null);
}

class _$SchoolDatabaseBuilder {
  _$SchoolDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SchoolDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SchoolDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SchoolDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SchoolDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SchoolDatabase extends SchoolDatabase {
  _$SchoolDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDAO? _studentDAOInstance;

  UserDAO? _userDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Student` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `age` INTEGER NOT NULL, `gender` TEXT NOT NULL, `address` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fname` TEXT NOT NULL, `lname` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDAO get studentDAO {
    return _studentDAOInstance ??= _$StudentDAO(database, changeListener);
  }

  @override
  UserDAO get userDAO {
    return _userDAOInstance ??= _$UserDAO(database, changeListener);
  }
}

class _$StudentDAO extends StudentDAO {
  _$StudentDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'gender': item.gender,
                  'address': item.address
                }),
        _studentUpdateAdapter = UpdateAdapter(
            database,
            'Student',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'gender': item.gender,
                  'address': item.address
                }),
        _studentDeletionAdapter = DeletionAdapter(
            database,
            'Student',
            ['id'],
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'gender': item.gender,
                  'address': item.address
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  final UpdateAdapter<Student> _studentUpdateAdapter;

  final DeletionAdapter<Student> _studentDeletionAdapter;

  @override
  Future<List<Student>> getAllStudents() async {
    return _queryAdapter.queryList('SELECT * FROM student',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['name'] as String,
            age: row['age'] as int,
            gender: row['gender'] as String,
            address: row['address'] as String));
  }

  @override
  Future<Student?> findStudentByName(String name) async {
    return _queryAdapter.query('SELECT * FROM student WHERE name = ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            name: row['name'] as String,
            age: row['age'] as int,
            gender: row['gender'] as String,
            address: row['address'] as String),
        arguments: [name]);
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateStudent(Student student) async {
    await _studentUpdateAdapter.update(student, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteStudent(Student student) async {
    await _studentDeletionAdapter.delete(student);
  }
}

class _$UserDAO extends UserDAO {
  _$UserDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'fname': item.fname,
                  'lname': item.lname,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<User?> login(String email, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM user WHERE email = ?1 and password = ?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            fname: row['fname'] as String,
            lname: row['lname'] as String,
            email: row['email'] as String,
            password: row['password'] as String),
        arguments: [email, password]);
  }

  @override
  Future<void> register(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}
