import 'package:e_softwarica/entities/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDAO {
// Register user
  @insert
  Future<void> register(User user);

  // login user
  @Query('SELECT * FROM user WHERE email = :email and password = :password')
  Future<User?> login(String email, String password);
}
