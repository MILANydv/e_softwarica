import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String name;
  int age;
  String gender;
  String address;

  Student(
      {this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.address});
}
