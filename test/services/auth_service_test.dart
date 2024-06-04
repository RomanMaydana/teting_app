import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_app/models/user.dart';
import 'package:testing_app/repositories/auth_repository.dart';
import 'package:testing_app/services/authentication_service.dart';

@GenerateMocks([AuthRepository])
import 'auth_service_test.mocks.dart';

void main() {
  group('AuthenticationService', () {
    late AuthenticationService authService;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authService = AuthenticationService(authRepository: mockAuthRepository);
    });

    test('ogin returns a user for valid credentials', () async {
      final user = User(id: '1', email: 'test@example.com');
      when(mockAuthRepository.login('test@example.com', 'password'))
          .thenAnswer((_) async => user);
      final result = await authService.login('test@example.com', 'password');

      expect(result, isNotNull);
      expect(result!.id, '1');
      expect(result.email, 'test@example.com');
      verify(mockAuthRepository.login('test@example.com', 'password'))
          .called(1);
    });
    test('login returns null for invalid credentials', () async {
      // Configurar el mock para devolver null
      when(mockAuthRepository.login('test@example.com', 'wrongpassword'))
          .thenAnswer((_) async => null);

      // Llamar al método que estamos probando
      final result =
          await authService.login('test@example.com', 'wrongpassword');

      // Verificar los resultados
      expect(result, isNull);

      // Verificar si login fue llamado con los argumentos correctos
      verify(mockAuthRepository.login('test@example.com', 'wrongpassword'))
          .called(1);
    });

    test('logout calls the logout method in the repository', () async {
      // Configurar el mock para aceptar cualquier llamada a logout
      when(mockAuthRepository.logout()).thenAnswer((_) async => {});

      // Llamar al método que estamos probando
      await authService.logout();

      // Verificar si logout fue llamado
      verify(mockAuthRepository.logout()).called(1);
    });
  }); 
}
