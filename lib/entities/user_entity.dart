import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String fname;
  String lname;
  String email;
  String password;

  User({
    this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
  });
}
