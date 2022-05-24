import 'package:e_softwarica/entities/student_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class StudentDAO {
  @Query('SELECT * FROM student')
  Future<List<Student>> getAllStudents();

  @Query('SELECT * FROM student WHERE name = :name')
  Future<Student?> findStudentByName(String name);

  @insert
  Future<void> insertStudent(Student student);

  @update
  Future<void> updateStudent(Student student);

  @delete
  Future<void> deleteStudent(Student student);
}
