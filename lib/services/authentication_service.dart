import 'package:testing_app/repositories/auth_repository.dart';

import '../models/user.dart';

class AuthenticationService {
  AuthenticationService({required this.authRepository});
  final AuthRepository authRepository;

 Future<User?> login(String email, String password) async {
    return await authRepository.login(email, password);
  }

  Future<void> logout() async {
    await authRepository.logout();
  }
}
