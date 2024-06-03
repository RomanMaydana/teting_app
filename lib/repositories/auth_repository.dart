import '../models/user.dart';

abstract class AuthRepository {
  Future<User?> login(String username, String passwird);
  Future<void> logout();
}
